import 'dart:math';

String generateFiveDigitString() {
  final random = Random();
  final randomNumber =
      random.nextInt(90000) + 10000; // Ensures a 5-digit number
  return randomNumber.toString();
}
