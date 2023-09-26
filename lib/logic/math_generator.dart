import 'dart:math';

class MathGenerator {
  late int _a;
  late int _b;

  late String _operator;

  late List<double> generatorNumbers;

  late String screenText;

  static Random random = Random();

  MathGenerator() {
    // _a = random.nextInt(50) + 1;
    // _b = random.nextInt(50) + 1;
    //
    // _operator = _toOperator(random.nextInt(4));
    // generatorNumbers = createAnswers();
    //
    // screenText = createScreenText();

    restart();
  }

  String _toOperator(int index) =>
      switch(index){
        0 => "+",
        1 => "-",
        2 => "*",
        3 => "/",
        _ => "+",
      };

  double correctAnswer() =>
      switch(_operator){
        "+" => (_a + _b).toDouble(),
        "-" => (_a - _b).toDouble(),
        "*" => (_a * _b).toDouble(),
        "/" => (_a / _b).toDouble(),
        _ => 0.0,
      };

  List<double> createList() {
    return List.generate(3, (index) => random.nextInt(200) + 1);
  }

  List<double> createAnswers() {
    List<double> temp;
    do {
      temp = createList();
      temp.add(correctAnswer());
    }
    while (temp.length != temp
        .toSet()
        .length);
    return temp..shuffle();
  }


   String createScreenText(){
    return "$_a $_operator $_b = ?";
   }

  void restart(){
    _a = random.nextInt(50) + 1;
    _b = random.nextInt(50) + 1;
    _operator = _toOperator(random.nextInt(4));
    generatorNumbers = createAnswers();
    screenText = createScreenText();
  }

}