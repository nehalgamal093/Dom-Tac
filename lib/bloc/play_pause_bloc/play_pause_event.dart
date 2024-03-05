part of 'play_pause_bloc.dart';

sealed class PlayPauseEvent extends Equatable {
  const PlayPauseEvent();

  @override
  List<Object> get props => [];
}

class PlayPause extends PlayPauseEvent {}

class PlayEvent extends PlayPauseEvent {}

class PauseEvent extends PlayPauseEvent {}
