import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_fun_event.dart';
part 'radio_fun_state.dart';

class RadioFunBloc extends Bloc<RadioFunEvent, RadioFunState> {
  RadioFunBloc() : super(const RadioFunState(index: -1)) {
    on<RadioFunEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
