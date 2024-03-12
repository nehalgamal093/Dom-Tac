// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_last_played_position_event.dart';
part 'get_last_played_position_state.dart';

class GetLastPlayedPositionBloc
    extends Bloc<GetLastPlayedPositionEvent, GetLastPlayedPositionState> {
  GetLastPlayedPositionBloc() : super(GetLastPlayedPositionState.initial()) {
    on<LastPLayedPositionEvent>((event, emit) {
      emit(state.copyWith(lastPlayedPosition: event.lastPlayedPosition));
    });
  }
}
