import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Circles on the background
        Align(
          alignment: const AlignmentDirectional(3, -0.3),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-3, -0.3),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF673AB7),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, -1.2),
          child: Container(
            height: 300,
            width: 600,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
        ),
        // Background blur
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 150.0,
            sigmaY: 120.0,
            tileMode: TileMode.clamp,
          ),
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
          ),
        ),
      ],
    );
  }
}
