enum Result {
      underweight,
      normal,
      overweight,
      obesity,
  }

class BodyMassIndex {
  double weightKg;
  double heightCentimeter;
  

  BodyMassIndex({required this.weightKg, required this.heightCentimeter});
  

  double calculBodyWeight(){
    double heightMeter = heightCentimeter / 100;
    double bodyMassIndex = weightKg / (heightMeter * heightMeter);
    return bodyMassIndex;
  }

  String getBodyMassIndex(){
    double massIndex = calculBodyWeight();
    if (massIndex < 18.5) {
      return Result.underweight.name;
    } else if (massIndex >= 18.5 && massIndex < 24.9) {
      return Result.normal.name;
    } else if (massIndex >= 25 && massIndex < 29.9) {
      return Result.overweight.name;
    } else {
      return Result.overweight.name;
    }
  }

}