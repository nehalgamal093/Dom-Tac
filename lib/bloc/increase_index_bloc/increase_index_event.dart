part of 'increase_index_bloc.dart';

sealed class IncreaseIndexEvent extends Equatable {
  const IncreaseIndexEvent();

  @override
  List<Object> get props => [];
}

class IncreaseEvent extends IncreaseIndexEvent {
  final int index;
  const IncreaseEvent(this.index);

  @override
  List<Object> get props => [index];
}
