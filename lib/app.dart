
import 'package:class_assignment_2/cubit/bmi_calculator_cubit.dart';
import 'package:class_assignment_2/cubit/circle_area_cubit.dart';
import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_2/view/dashboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/dashboard_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> SimpleInterestCubit()),
      BlocProvider(create: (context)=> CircleAreaCubit()),
      BlocProvider(create: (context)=> BMICubit()),
      BlocProvider(create: (context) => DashboardCubit(
        context.read<BMICubit>(),
        context.read<CircleAreaCubit>(),
        context.read<SimpleInterestCubit>(),

      ),),

    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter bloc',
      home: DashboardView(),

    ),
    );
  }
}
