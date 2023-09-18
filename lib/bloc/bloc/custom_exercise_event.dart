part of 'custom_exercise_bloc.dart';

@immutable
sealed class CustomExerciseEvent {}

class CustomExerciseLogin extends CustomExerciseEvent {}

class CustomExerciseUpdateUser extends CustomExerciseEvent {
  CustomExerciseUpdateUser();
}

class CustomExerciseAddTime extends CustomExerciseEvent {
  final TimeData? timeData;
  final int? index;

  CustomExerciseAddTime({this.index, this.timeData});
}
