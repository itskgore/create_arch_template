import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patientvisit/feature/voice_recorder/presentation/cubit/voice_recorder_cubit.dart';
import 'package:patientvisit/feature/voice_recorder/presentation/cubit/voice_recorder_state.dart';
import 'package:patientvisit/feature/voice_recorder/presentation/page/audio_player.dart';
import 'package:patientvisit/feature/voice_recorder/presentation/page/audio_recorder.dart';
import 'package:patientvisit/feature/voice_recorder/presentation/widgets/record_widgets.dart';

class VoiceRecorder extends StatefulWidget {
  const VoiceRecorder({Key? key}) : super(key: key);

  @override
  State<VoiceRecorder> createState() => _VoiceRecorderState();
}

class _VoiceRecorderState extends State<VoiceRecorder> {
  bool showPlayer = false;
  String? audioPath;
  late VoiceRecorderCubit voiceRecorderCubit;

  @override
  void initState() {
    super.initState();
    voiceRecorderCubit = BlocProvider.of<VoiceRecorderCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Appointments Details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 152, 116, 1),
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: BlocBuilder<VoiceRecorderCubit, VoiceRecorderState>(
          builder: (context, state) {
        if (state is VoiceRecorderLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (state is ShowPlayerState) {
            showPlayer = state.showPlayer;
          } else if (state is UpdatePlayerState) {
            audioPath = state.audioPath;
            showPlayer = state.showPlayer;
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Voice Recorder',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please record the conversation with the patient.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.64,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      showPlayer
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: AudioPlayer(
                                source: audioPath!,
                                onDelete: () {
                                  voiceRecorderCubit.changeShowPlayer(false);
                                },
                              ),
                            )
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            ),
                      showPlayer
                          ? const SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : AudioRecorder(
                              onStop: (path) {
                                if (kDebugMode)
                                  print('Recorded file path: $path');
                                voiceRecorderCubit.updatePlayer(path, true);
                              },
                            ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: showPlayer
                          ? () {
                              voiceRecorderCubit.changeShowPlayer(false);
                            }
                          : () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: showPlayer
                              ? const BorderSide(
                                  color: Color.fromRGBO(0, 152, 116, 1),
                                  width: 1)
                              : const BorderSide(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          showPlayer
                              ? Image.asset(
                                  'assets/cancelActive.png',
                                  height: 20,
                                  width: 20,
                                )
                              : Image.asset(
                                  'assets/cancelInactive.png',
                                  height: 20,
                                  width: 20,
                                ),
                          const SizedBox(width: 3),
                          Text(
                            'Cancel Recording',
                            style: showPlayer
                                ? const TextStyle(
                                    color: Color.fromRGBO(0, 152, 116, 1))
                                : const TextStyle(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.my_library_books_rounded,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Submit Recording',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: showPlayer
                          ? () {
                              submitRecoringDialog();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color.fromRGBO(0, 152, 116, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: showPlayer
                              ? const BorderSide(
                                  color: Color.fromRGBO(0, 152, 116, 1),
                                  width: 2)
                              : const BorderSide(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  void submitRecoringDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          // insetPadding: EdgeInsets.symmetric(horizontal: 26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 30),
                const Icon(Icons.mic, size: 60),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Submit Recording?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Are you done with recording the conversation?',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Center(
                  child: RichTextWidget(),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    elevatedButtonWidget(
                      width: 200,
                      text: 'Submit Recording',
                      backgroundColor: Color.fromRGBO(0, 152, 116, 1),
                      borderColor: Color.fromRGBO(0, 152, 116, 1),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                        voiceRecorderCubit.submitRecording(audioPath!);
                      },
                    ),
                    const SizedBox(height: 10),
                    elevatedButtonWidget(
                      width: 200,
                      text: 'Cancel',
                      backgroundColor: Colors.white,
                      borderColor: Color.fromRGBO(0, 152, 116, 1),
                      textColor: Color.fromRGBO(0, 152, 116, 1),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
