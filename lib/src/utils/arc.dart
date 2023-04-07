import 'package:flutter/material.dart';

class Arc extends StatelessWidget {
  final double height;
  final Widget child;

  const Arc({this.height = 50, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ArcClipper(height),
      child: child,
    );
  }
}

class _ArcClipper extends CustomClipper<Path> {
  final double height;

  _ArcClipper(this.height);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - height);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(_ArcClipper oldClipper) => false;
}
