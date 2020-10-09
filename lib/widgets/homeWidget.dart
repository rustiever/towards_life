import 'package:flutter/widgets.dart';

class WaveClipperOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 60 + 40);

    final firstEndPoint = Offset(size.width * 0.6, size.height - 30 - 50 + 40);
    final firstControlPoint =
        Offset(size.width * .25, size.height - 60 - 50 + 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint = Offset(size.width, size.height - 60 + 40);
    final secondControlPoint = Offset(size.width * 0.89, size.height - 46 + 40);
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

    // Since the wave goes vertically lower than bottom left at some point,
    path.lineTo(0.0, size.height - 150 + 40);

    final firstEndPoint = Offset(size.width - 80, size.height - 62 + 40);
    final firstControlPoint = Offset(size.width * 0.52, size.height - 180 + 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint = Offset(size.width, size.height - 60 + 40);
    final secondControlPoint = Offset(size.width * 0.89, size.height - 48 + 40);
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

class WaveClipperFour extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Since the wave goes vertically lower than bottom left at some point,
    path.lineTo(0, size.height - 150 + 40);

    final firstEndPoint = Offset(size.width * 3.5 / 5, size.height - 93 + 40);
    final firstControlPoint =
        Offset(size.width * 0.415, size.height - 178 + 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint = Offset(size.width, size.height - 160 + 40);
    final secondControlPoint =
        Offset(size.width * 4.12 / 5, size.height - 75 + 40);
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

    // Since the wave goes vertically lower than bottom left at some point,
    path.lineTo(0.0, size.height - 150 + 40);

    final firstEndPoint = Offset(size.width * 2.2 / 5, size.height - 145 + 40);
    final firstControlPoint = Offset(size.width * 0.25, size.height - 165 + 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint = Offset(0, size.height - 220 + 40);
    final secondControlPoint =
        Offset(size.width * 1.5 / 5, size.height - 210 + 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipperFive extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 219.8 + 40);

    final firstEndPoint = Offset(size.width * 2.15 / 5, size.height - 149 + 40);
    final firstControlPoint = Offset(size.width * .24, size.height - 214 +40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    final secondEndPoint = Offset(size.width, size.height * .05+2);
    final secondControlPoint = Offset(size.width * 0.75, size.height - 136 + 40);
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
