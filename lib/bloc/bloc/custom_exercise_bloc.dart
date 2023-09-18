import 'package:bloc/bloc.dart';
import 'package:exercise_app/api/api_result.dart';
import 'package:exercise_app/bloc/bloc/custom_exercise_state.dart';
import 'package:exercise_app/config/enum/statestatus.dart';
import 'package:exercise_app/repo/auth.dart';
import 'package:exercise_app/utils/dialog_utils.dart';
import 'package:meta/meta.dart';

part 'custom_exercise_event.dart';

class CustomExerciseBloc
    extends Bloc<CustomExerciseEvent, CustomExerciseState> {
  CustomExerciseBloc()
      : super(CustomExerciseState(
            breakList: [TimeData(hour: 08, minute: 00, am: "AM")])) {
    on<CustomExerciseLogin>((event, emit) async {
      
      AuthandUpdateRepo.loginapi();
    });
    on<CustomExerciseUpdateUser>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));
      List<String> list = state.breakList
          .map((e) =>
              "${((e.am == "PM") ? e.hour != 12 ? e.hour + 12 : 12 : e.hour == 12 ? 24 : e.hour < 10 ? "0${e.hour}" : e.hour)}:${e.minute < 10 ? 0 : ""}${e.minute}")
          .toList();
      print(list);
      ApiResult<String> response = await AuthandUpdateRepo.updateUser(list);
      if (response is Sucsess) {
        emit(state.copyWith(stateStatus: StateStatus.sucsess));
      } else {
        emit(state.copyWith(stateStatus: StateStatus.failure));
      }
    });
    on<CustomExerciseAddTime>((event, emit) async {
      List<TimeData> timedata = List.from(state.breakList);
      if (event.index != null) {
        timedata.removeAt(event.index!);
      } else {
        if (event.timeData != null) {
          timedata.add(event.timeData!);
        }
      }
      if (event.timeData != null && event.index != null) {
        timedata.insert(event.index!, event.timeData!);
      }
      emit(state.copyWith(breakList: timedata));
      // emit()
    });
  }
}
