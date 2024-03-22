import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Variables
  String displayText = '0';
  double num1 = 0.0;
  String operand = '';
  bool isOperandPressed = false;

  // Method to handle button press
// Method to handle button press
  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        // Clear button
        displayText = '0';
        num1 = 0.0;
        operand = '';
        isOperandPressed = false;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        // Operations
        if (!isOperandPressed) {
          num1 = double.parse(displayText);
          operand = buttonText;
          isOperandPressed = true;
          // Reset displayText for new number entry after operation
          displayText = '';
        }
      } else if (buttonText == '=') {
        // Calculate result
        double num2 = double.parse(displayText);
        double result = 0.0;
        switch (operand) {
          case '+':
            result = num1 + num2;
            break;
          case '-':
            result = num1 - num2;
            break;
          case '*':
            result = num1 * num2;
            break;
          case '/':
            result = num1 / num2;
            break;
          default:
            result = 0.0;
        }
        // Check if result is a whole number, convert to integer if so
        if (result % 1 == 0) {
          displayText = result.toInt().toString();
        } else {
          displayText = result.toString();
        }
        isOperandPressed = false;
      } else {
        // Append number or decimal point
        if (displayText == '0') {
          displayText = buttonText;
        } else {
          displayText += buttonText;
        }
      }
    });
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                displayText,
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('0'),
              buildButton('.'),
              buildButton('C'),
              buildButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton('='),
            ],
          ),
        ],
      ),
    );
  }

  // Build calculator button
  Widget buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => buttonPressed(buttonText),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
