import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'increase_index_event.dart';
part 'increase_index_state.dart';

class IncreaseIndexBloc extends Bloc<IncreaseIndexEvent, IncreaseIndexState> {
  IncreaseIndexBloc() : super(IncreaseIndexState.initial()) {
    on<IncreaseIndexEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  FutureOr<void> _pause(IncreaseEvent event, Emitter<IncreaseIndexState> emit) {
    emit(state.copyWith(increaseIndex: event.index + 1));
  }
}
