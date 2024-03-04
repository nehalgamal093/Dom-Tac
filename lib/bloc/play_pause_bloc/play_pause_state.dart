part of 'play_pause_bloc.dart';

enum PlayOrPauseStatus { play, pause }

class PlayPauseState extends Equatable {
  final PlayOrPauseStatus playOrPauseStatus;

  const PlayPauseState({required this.playOrPauseStatus});

  factory PlayPauseState.initial() {
    return const PlayPauseState(playOrPauseStatus: PlayOrPauseStatus.play);
  }

  @override
  List<Object?> get props => [playOrPauseStatus];

  PlayPauseState copyWith({PlayOrPauseStatus? playOrPauseStatus}) {
    return PlayPauseState(
        playOrPauseStatus: playOrPauseStatus ?? this.playOrPauseStatus);
  }
}
