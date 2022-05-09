import 'package:flutter/material.dart';
import 'package:science_calc/widgets/calculator_button.dart';
import 'package:science_calc/widgets/alert_dialog.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _history = '';
  String _expression = '';

  void numOrOperatorClick(String text) {
    switch (text) {
      case "×":
        text = "*";
        break;
      case "÷":
        text = "/";
        break;
      case "x²":
        text = "^2";
        break;
      case "eˣ":
        text = "e^";
        break;
      case "xʸ":
        text = "^";
        break;
      case "√x":
        text = "sqrt(";
        break;
      case "ln":
        text = "ln(";
        break;
      case "sin":
        text = "sin(";
        break;
      case "cos":
        text = "cos(";
        break;
      case "tan":
        text = "tan(";
        break;
    }
    setState(() => _expression += text);
  }

  void clear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void removeOneElement(String text) {
    setState(() => {
          if (_expression.isNotEmpty)
            _expression = _expression.substring(0, _expression.length - 1)
        });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse("0");
    ContextModel cm = ContextModel();
    bool hasException = false;
    try {
      exp = p.parse(_expression);
    } on FormatException catch (e) {
      hasException = true;
      showAlertDialog(context, e.toString());
    }
    if (!hasException) {
      setState(() {
        _history = _expression;
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    } else {
      setState(() {
        _expression = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Calculator",
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: Scaffold(
            appBar: AppBar(title: const Text("Calculator")),
            backgroundColor: const Color.fromARGB(255, 5, 101, 116),
            body: Center(
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(_history,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color:
                                          Color.fromARGB(255, 166, 202, 207))),
                            ),
                            alignment: const Alignment(1.0, 1.0),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(_expression,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                            ),
                            alignment: const Alignment(1.0, 1.0),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CalculatorButton(
                                  text: "(",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: ")",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "C",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: clear,
                                ),
                                CalculatorButton(
                                  text: "<",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: removeOneElement,
                                ),
                                CalculatorButton(
                                  text: "%",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "÷",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CalculatorButton(
                                  text: "x²",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "eˣ",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "7",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "8",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "9",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "×",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CalculatorButton(
                                  text: "xʸ",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "√x",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "4",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "5",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "6",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "-",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CalculatorButton(
                                  text: "sin",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "cos",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "1",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "2",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "3",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "+",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CalculatorButton(
                                  text: "tan",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "ln",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "0",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "00",
                                  backgroundColor:
                                      const Color.fromARGB(168, 107, 226, 242),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: ".",
                                  backgroundColor:
                                      const Color.fromARGB(255, 212, 106, 19),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 20,
                                  callback: numOrOperatorClick,
                                ),
                                CalculatorButton(
                                  text: "=",
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  textColor: const Color.fromARGB(255, 0, 0, 0),
                                  textSize: 40,
                                  callback: evaluate,
                                ),
                              ])
                        ])))));
  }
}
