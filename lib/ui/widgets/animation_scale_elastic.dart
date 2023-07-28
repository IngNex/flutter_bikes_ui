import 'package:flutter/material.dart';

class AnimationScaleElastic extends StatelessWidget {
  const AnimationScaleElastic({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.offset = 100,
  }) : super(key: key);
  final Widget child;
  final Duration duration;
  final int offset;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      child: child,
      builder: (context, value, _) {
        return Transform.scale(
          scale: value,
          //origin: Offset(0, offset * value),
          child: _,
        );
      },
    );
  }
}
