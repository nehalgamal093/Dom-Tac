part of 'get_last_played_audio_bloc.dart';

sealed class GetLastPlayedAudioEvent extends Equatable {
  const GetLastPlayedAudioEvent();

  @override
  List<Object> get props => [];
}

class LastPlayedIndexEvent extends GetLastPlayedAudioEvent {
  final int lastPlayedIndex;
  const LastPlayedIndexEvent({
    required this.lastPlayedIndex,
  });

  @override
  String toString() => 'SetSearchTermEvent(newSearchTerm: $lastPlayedIndex)';

  @override
  List<Object> get props => [lastPlayedIndex];
}
