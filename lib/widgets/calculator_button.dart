import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final Function callback;
  // ignore: use_key_in_widget_constructors
  const CalculatorButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.textSize,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 80,
          height: 70,
          child: TextButton(
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
            ),
            style: TextButton.styleFrom(
              primary: textColor,
              side: const BorderSide(
                  width: 2, color: Color.fromARGB(255, 0, 188, 212)),
              backgroundColor: backgroundColor,
            ),
            onPressed: () => {
              callback(text),
            },
          ),
        ));
  }
}
