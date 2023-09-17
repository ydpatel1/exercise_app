import 'package:exercise_app/utils/any_radio.dart/radio_bloc/radio_fun_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnyRadio extends StatelessWidget {
  const AnyRadio({super.key, required this.index, required this.child});
  final int index;
  final Widget Function(bool index) child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioFunBloc, RadioFunState>(
      buildWhen: (previous, current) {
        if ((previous.index == index) || (current.index == index)) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return child(state.index == index);
      },
    );
  }
}
