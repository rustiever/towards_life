import 'package:flutter/widgets.dart';

class WaveClipperOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height * 6 / 7);

    final firstEndPoint = Offset(size.width * 0.55, size.height * 0.8);
    final firstControlPoint = Offset(size.width * .25, size.height * 0.6);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint = Offset(size.width, size.height * 0.85);
    final secondControlPoint = Offset(size.width * 0.85, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height * 6 / 7);

    final firstEndPoint = Offset(size.width * 3.5 / 5, size.height * 0.8);
    final firstControlPoint = Offset(size.width * 0.42, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint = Offset(size.width, size.height / 4);
    final secondControlPoint = Offset(size.width * 0.1, size.height * 0.5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipperThree extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, size.height * 6 / 7 - size.height * 0.5);

    final firstEndPoint =
        Offset(size.width * 0.55, size.height * 0.8 - size.height * 0.5);
    final firstControlPoint =
        Offset(size.width * .25, size.height * 0.6 - size.height * 0.5);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint =
        Offset(size.width, size.height * 0.85 - size.height * 0.5);
    final secondControlPoint =
        Offset(size.width * 0.85, size.height - size.height * 0.5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - size.height * 0.5);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
