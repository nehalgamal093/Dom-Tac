part of 'increase_index_bloc.dart';

enum PlayOrPauseStatus { play, pause }

class IncreaseIndexState extends Equatable {
  final int increaseIndex;

  const IncreaseIndexState({required this.increaseIndex});

  factory IncreaseIndexState.initial() {
    return const IncreaseIndexState(increaseIndex: 0);
  }

  @override
  List<Object?> get props => [increaseIndex];

  IncreaseIndexState copyWith({int? increaseIndex}) {
    return IncreaseIndexState(
        increaseIndex: increaseIndex ?? this.increaseIndex);
  }
}
