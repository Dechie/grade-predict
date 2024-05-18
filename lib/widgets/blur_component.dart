import 'package:flutter/material.dart';
import 'dart:ui';

class BlurComponent extends StatelessWidget {
  const BlurComponent({
    super.key,
    required this.height,
    required this.width,
    required this.widget,
  });

  final double height, width;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: SizedBox(
          height: height,
          width: width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}
