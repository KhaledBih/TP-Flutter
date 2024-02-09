import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/controller/CalculatorModel.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultat'),
      ),
      body: Center(
        child: Consumer<CalculatorModel>(
          builder: (context, calculatorModel, child) {
            return Text(
              'Résultat = ${calculatorModel.result}',
              style: const TextStyle(fontSize: 24.0),
            );
          },
        ),
      ),
    );
  }
}
