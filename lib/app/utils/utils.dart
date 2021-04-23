import 'dart:math';
import 'dart:ui';

Color generateRandomColor2() {
  final Random random = Random();
  final double randomDouble = random.nextDouble();
  return Color(
    (randomDouble * 0xFFFFFF).toInt(),
  ).withOpacity(1.0);
}

Color generateRandomColor3() {
  final Random random = Random();

  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
