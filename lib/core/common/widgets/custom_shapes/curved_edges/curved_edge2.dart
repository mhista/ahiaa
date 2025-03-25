import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //  height: 180,
    //                           width: 180,

    double cutUpward = 35; // Cut 35px upward from bottom-right
    double cutInward = 65; // Cut 65px inward from bottom-right
    double curveRadius = 20;
    // Start from top-left
    path.moveTo(0, 0);

    // Top-right
    path.lineTo(size.width, 0);

    // Move down to the bottom-right cut point (before the curve)
    path.lineTo(size.width, size.height - cutUpward - curveRadius);

    // Rounded edge at the upward cut
    path.quadraticBezierTo(
      size.width,
      size.height - cutUpward, // Control point
      size.width - curveRadius,
      size.height - cutUpward, // End of curve
    );

    // Smooth inward cut using the updated quadraticBezierTo
    path.quadraticBezierTo(
      size.width - 65,
      size.height - 42, // Control point
      size.width - 60,
      size.height - 10, // End of curve
    );

    // Smooth bottom-right to bottom-left curve
    path.quadraticBezierTo(
      size.width - 60,
      size.height - 20, // Control point
      size.width - 60,
      size.height - 5, // End of curve
    );

    path.quadraticBezierTo(
      size.width - 60,
      size.height, // Control point
      size.width - 70,
      size.height, // End of curve
    );

    // Bottom-left
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
