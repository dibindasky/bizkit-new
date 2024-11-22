import 'dart:async';
import 'package:flutter/material.dart';

class WordByWordTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Duration wordDisplayDuration;
  final EdgeInsets padding;
  final TextAlign textAlign;
  final VoidCallback? onTap;

  const WordByWordTextAnimation({
    Key? key,
    required this.text,
    this.textStyle,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.textAlign =TextAlign.center,
    this.wordDisplayDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<WordByWordTextAnimation> createState() =>
      _WordByWordTextAnimationState();
}

class _WordByWordTextAnimationState extends State<WordByWordTextAnimation> {
  late List<String> words;
  late String displayedText = "";
  late int currentWordIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    words = widget.text.split(" ");
    _startAnimation();
  }

  void _startAnimation() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.wordDisplayDuration, (timer) {
      if (currentWordIndex < words.length) {
        setState(() {
          displayedText += (displayedText.isEmpty ? "" : " ") + words[currentWordIndex];
          currentWordIndex++;
        });
      } else {
        // Animation complete, stop the timer
        timer.cancel();

        // Wait 5 seconds and restart the animation
        Future.delayed(const Duration(seconds: 5), () {
          if (mounted) {
            setState(() {
              displayedText = "";
              currentWordIndex = 0;
            });
            _startAnimation();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding,
        child: Text(
          displayedText,
          style: widget.textStyle ?? const TextStyle(fontSize: 16),
          textAlign: widget.textAlign,
        ),
      ),
    );
  }
}
