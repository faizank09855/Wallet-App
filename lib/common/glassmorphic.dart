import 'package:flutter/material.dart';
import 'dart:ui';

class GlassContainer extends StatelessWidget {
  const GlassContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white.withValues(
                alpha: 0.1,
              ),
              style: BorderStyle.solid,
              width: 1),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withValues(
            alpha: 0.1,
            colorSpace: ColorSpace.extendedSRGB,
          )),
      child: child,
    );
  }
}
