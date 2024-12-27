import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/circle_area_cubit.dart';

class CircleAreaView extends StatelessWidget {
  const CircleAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: const Text(' Sachin Area of Circle Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(
                labelText: 'Radius (r)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            BlocBuilder<CircleAreaCubit, double>(
              builder: (context, state) {
                return Text(
                  'Area of Circle: ${state.toStringAsFixed(2)} sq. units',
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
                    final double radius = double.tryParse(radiusController.text) ?? 0.0;
                    context.read<CircleAreaCubit>().calculate(radius);
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    radiusController.clear();
                    context.read<CircleAreaCubit>().reset();
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