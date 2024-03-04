import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'play_pause_event.dart';
part 'play_pause_state.dart';

class PlayPauseBloc extends Bloc<PlayPauseEvent, PlayPauseState> {
  PlayPauseBloc() : super(PlayPauseState.initial()) {
    on<PlayPause>(_playPause);
  }

  FutureOr<void> _playPause(PlayPause event, Emitter<PlayPauseState> emit) {
    emit(state.copyWith(
        playOrPauseStatus: state.playOrPauseStatus == PlayOrPauseStatus.pause
            ? PlayOrPauseStatus.play
            : PlayOrPauseStatus.pause));
  }
}
