import 'package:flutter/material.dart';

class SoundWaveformWidget extends StatefulWidget {
  final int count;
  final double minHeight;
  final double maxHeight;
  final int durationInMilliseconds;
  const SoundWaveformWidget({
    super.key,
    this.count = 6,
    this.minHeight = 10,
    this.maxHeight = 60,
    this.durationInMilliseconds = 2000,
  });

  @override
  State<SoundWaveformWidget> createState() => _SoundWaveformWidgetState();
}

class _SoundWaveformWidgetState extends State<SoundWaveformWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: widget.durationInMilliseconds,
        ))
      ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.count;
    final minHeight = widget.minHeight;
    final maxHeight = widget.maxHeight;
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (c, child) {
          double t = controller.value;
          int current = (count * t).floor();
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              count,
              (i) => AnimatedContainer(
                duration: Duration(
                    milliseconds: widget.durationInMilliseconds ~/ count),
                margin: i == (count - 1)
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(right: 5),
                height: i == current ? maxHeight : minHeight,
                width: 8,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 152, 116, 1),
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
