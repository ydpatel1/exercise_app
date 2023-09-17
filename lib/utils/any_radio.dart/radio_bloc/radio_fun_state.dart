part of 'radio_fun_bloc.dart';

@immutable
class RadioFunState {
  final int index;
  const RadioFunState({
    required this.index,
  });

  RadioFunState copyWith({
    int? index,
  }) {
    return RadioFunState(
      index: index ?? this.index,
    );
  }

  @override
  String toString() => 'RadioFunState(index: $index)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RadioFunState && other.index == index;
  }

  @override
  int get hashCode => index.hashCode;
}
