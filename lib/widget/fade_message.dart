import 'package:flutter/material.dart';

import 'dart:async';

class DurationMessage extends StatefulWidget {
  const DurationMessage(
      {super.key, required this.duration, required this.children});

  final Duration duration;
  final List<Widget> children;

  @override
  State<DurationMessage> createState() => _DurationMessageState();
}

class _DurationMessageState extends State<DurationMessage> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _currentIndex++;
        if (_currentIndex >= widget.children.length) {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final endIndex = (_currentIndex + 1).clamp(0, widget.children.length);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.children
          .sublist(0, endIndex)
          .map((childWidget) => AnimatedOpacity(
                opacity: _currentIndex >= widget.children.length ? 1.0 : 0.0,
                duration: widget.duration,
                child: childWidget,
              ))
          .toList(),
    );
  }
}
