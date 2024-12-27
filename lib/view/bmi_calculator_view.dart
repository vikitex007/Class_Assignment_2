import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bmi_calculator_cubit.dart';

class BMIView extends StatelessWidget {
  const BMIView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController weightController = TextEditingController();
    final TextEditingController heightController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Sachin BMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(
                labelText: 'Height (m)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            BlocBuilder<BMICubit, double>(
              builder: (context, state) {
                return Text(
                  'BMI: ${state.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    final double weight = double.tryParse(weightController.text) ?? 0.0;
                    final double height = double.tryParse(heightController.text) ?? 0.0;
                    context.read<BMICubit>().calculate(weight, height);
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    weightController.clear();
                    heightController.clear();
                    context.read<BMICubit>().reset();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
