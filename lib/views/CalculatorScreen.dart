import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test1/controller/CalculatorModel.dart';
import 'package:test1/pages/ResultScreen.dart'; // Import the ResultScreen

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late TextEditingController _firstNumberController;
  late TextEditingController _secondNumberController;
  Operation _selectedOperation = Operation.addition;

  @override
  void initState() {
    super.initState();
    _firstNumberController = TextEditingController();
    _secondNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    super.dispose();
  }

  void _calculate(BuildContext context) {
    double firstNumber = double.tryParse(_firstNumberController.text) ?? 0.0;
    double secondNumber = double.tryParse(_secondNumberController.text) ?? 0.0;

    if (firstNumber == 0.0 || secondNumber == 0.0) {
      Fluttertoast.showToast(
        msg: "Veuillez entrer des valeurs valides",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }

    double result;
    switch (_selectedOperation) {
      case Operation.addition:
        result = firstNumber + secondNumber;
        break;
      case Operation.subtraction:
        result = firstNumber - secondNumber;
        break;
      case Operation.multiplication:
        result = firstNumber * secondNumber;
        break;
      case Operation.division:
        if (secondNumber != 0) {
          result = firstNumber / secondNumber;
        } else {
          Fluttertoast.showToast(
            msg: "Division par zéro",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          return;
        }
        break;
    }

    // Update the result in CalculatorModel
    Provider.of<CalculatorModel>(context, listen: false).result = result;

    // Navigate to the ResultScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculatrice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: TextField(
                      controller: _firstNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Premier nombre'),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: TextField(
                      controller: _secondNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Deuxième nombre'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var operation in Operation.values)
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedOperation = operation;
                          });
                        },
                        icon: Icon(operation.icon),
                        color: _selectedOperation == operation ? Colors.blue : Colors.grey,
                      ),
                      Text(operation.label),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calculate(context),
              child: const Text('Calculer'),
            ),
          ],
        ),
      ),
    );
  }
}

enum Operation { addition, subtraction, multiplication, division }

extension OperationExtension on Operation {
  IconData get icon {
    switch (this) {
      case Operation.addition:
        return Icons.add;
      case Operation.subtraction:
        return Icons.remove;
      case Operation.multiplication:
        return Icons.close;
      case Operation.division:
        return Icons.abc;
    }
  }

  String get label {
    switch (this) {
      case Operation.addition:
        return 'Addition';
      case Operation.subtraction:
        return 'Soustraction';
      case Operation.multiplication:
        return 'Multiplication';
      case Operation.division:
        return 'Division';
    }
  }
}
