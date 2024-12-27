import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/simple_interest_cubit.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController principalController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: const Text('Sachin Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: principalController,
              decoration: const InputDecoration(
                labelText: 'Principal (P)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: rateController,
              decoration: const InputDecoration(
                labelText: 'Rate of Interest (R%)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                labelText: 'Time (T years)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            BlocBuilder<SimpleInterestCubit, double>(
              builder: (context, state) {
                return Text(
                  'Simple Interest: ${state.toStringAsFixed(2)}',
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
                    final double principal = double.tryParse(principalController.text) ?? 0.0;
                    final double rate = double.tryParse(rateController.text) ?? 0.0;
                    final double time = double.tryParse(timeController.text) ?? 0.0;

                    context.read<SimpleInterestCubit>().calculate(principal, rate, time);
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    principalController.clear();
                    rateController.clear();
                    timeController.clear();
                    context.read<SimpleInterestCubit>().reset();
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
