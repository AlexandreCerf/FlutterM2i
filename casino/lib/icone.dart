import 'dart:math';

class Icone {
  List<int> numberList = [];

  List<String> symbols = ['bar','diamant','cerise','cloche','fer-a-cheval','pasteque','sept'];

  void pullRandomNumbers(numberList) {
    int value = 0;
    numberList.clear();
    var rng = Random();
    for (var i = 0; i < 3; i++) {
      value = rng.nextInt(7);
      numberList.add(value);
    }
  }

  String getImagePathForNumber(int number) {
    return "images/${symbols[number]}.png";
  }

  bool areEqual() {
    return numberList.every((number) => number == numberList[0]);
  }
}
