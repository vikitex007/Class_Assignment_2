import 'package:flutter_bloc/flutter_bloc.dart';

class CircleAreaCubit extends Cubit<double> {
  CircleAreaCubit() : super(0.0);

  void calculate(double radius) {
    emit(3.14159 * radius * radius);
  }

  void reset() {
    emit(0.0);
  }
}
