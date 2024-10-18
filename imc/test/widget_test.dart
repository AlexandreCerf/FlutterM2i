import 'package:flutter_test/flutter_test.dart';
import 'package:imc/body_mass_index.dart';

void main() {
  group('BodyMassIndex tests', () {
    test('Test with underweight BMI', () {
      BodyMassIndex bmi = BodyMassIndex(weightKg: 45, heightCentimeter: 160);
      
      String result = bmi.getBodyMassIndex();

      expect(result, Result.underweight.name);
    });

    test('Test with normal BMI', () {
      BodyMassIndex bmi = BodyMassIndex(weightKg: 70, heightCentimeter: 175);

      String result = bmi.getBodyMassIndex();

      expect(result, Result.normal.name);
    });

    test('Test with overweight BMI', () {
      BodyMassIndex bmi = BodyMassIndex(weightKg: 85, heightCentimeter: 175);

      String result = bmi.getBodyMassIndex();

      expect(result, Result.overweight.name);
    });

    test('Test with obesity BMI', () {
      BodyMassIndex bmi = BodyMassIndex(weightKg: 100, heightCentimeter: 160);

      String result = bmi.getBodyMassIndex();

      expect(result, Result.overweight.name);
    });
  });
}
