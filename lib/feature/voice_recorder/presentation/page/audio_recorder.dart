import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:patientvisit/feature/voice_recorder/presentation/widgets/sound_waveform.dart';
import 'package:record/record.dart';

class AudioRecorder extends StatefulWidget {
  final void Function(String path) onStop;

  const AudioRecorder({super.key, required this.onStop});

  @override
  State<AudioRecorder> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  int _recordDuration = 0;
  Timer? _timer;
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  late bool isRecordingStarted = false;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        setState(() {
          isRecordingStarted = true;
        });
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }
        await _audioRecorder.start();
        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stop() async {
    setState(() {
      isRecordingStarted = false;
    });
    _timer?.cancel();
    _recordDuration = 0;

    final path = await _audioRecorder.stop();

    if (path != null) {
      widget.onStop(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _recordState != RecordState.stop
                  ? const SizedBox(
                      height: 100,
                      child: SoundWaveformWidget(),
                    )
                  : const SizedBox(
                      height: 100,
                    ),
              _buildText(),
              const SizedBox(height: 40),
              _buildRecordStopControl(),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    late Color color = Color.fromRGBO(205, 60, 50, 1);

    return AvatarGlow(
        endRadius: 80,
        glowColor: color,
        animate: _recordState != RecordState.stop,
        duration: const Duration(milliseconds: 1000),
        repeatPauseDuration: const Duration(milliseconds: 200),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
            backgroundColor: color,
          ),
          child: _recordState != RecordState.stop
              ? Image.asset(
                  "assets/pause_icon.png",
                  height: 24,
                  width: 24,
                )
              : Image.asset(
                  "assets/mic_icon.png",
                  height: 24,
                  width: 24,
                ),
          onPressed: () {
            (_recordState != RecordState.stop) ? _stop() : _start();
            setState(() {});
          },
        ));
  }

  Widget _buildText() {
    if (_recordState != RecordState.stop) {
      return _buildTimer();
    }
    return const Text(
      'Start Recording',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildTimer() {
    final String hours = _formatNumber(_recordDuration ~/ 3600);
    final String minutes = _formatNumber((_recordDuration % 3600) ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$hours:$minutes:$seconds',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}
