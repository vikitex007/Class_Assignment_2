
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/dashboard_cubit.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: const Text('Sachin Dashboard'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: <Widget>[
          Card(
            color: Colors.blueGrey,
            child: InkWell(
              onTap: () {
                context.read<DashboardCubit>().openBMICalculatorView(context);
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.person, size: 48),
                  Text('BMI Calculator'),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,

            child: InkWell(
              onTap: () {
                context.read<DashboardCubit>().openCircleAreaView(context);
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.circle_outlined, size: 48),
                  Text('Area Of Circle Calculator'),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blueGrey,

            child: InkWell(
              onTap: () {context.read<DashboardCubit>().openSimpleInterestView(context);},
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.percent, size: 48),
                  Text('Simple Interest Calculator'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}