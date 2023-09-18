// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exercise_app/config/enum/statestatus.dart';
import 'package:exercise_app/utils/dialog_utils.dart';
import 'package:flutter/foundation.dart';

@immutable
class CustomExerciseState {
  final StateStatus stateStatus;
  final String? error;
  final List<TimeData> breakList;

  const CustomExerciseState({
    required this.breakList,
    this.stateStatus = StateStatus.pure,
    this.error,
  });

  CustomExerciseState copyWith(
      {StateStatus? stateStatus, String? error, List<TimeData>? breakList}) {
    return CustomExerciseState(
      stateStatus: stateStatus ?? this.stateStatus,
      breakList: breakList ?? this.breakList,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(covariant CustomExerciseState other) {
    if (identical(this, other)) return true;

    return other.stateStatus == stateStatus &&
        other.error == error &&
        listEquals(other.breakList, breakList);
  }

  @override
  int get hashCode =>
      stateStatus.hashCode ^ error.hashCode ^ breakList.hashCode;
}
