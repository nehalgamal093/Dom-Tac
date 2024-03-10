part of 'get_last_played_audio_bloc.dart';

class GetLastPlayedAudioState extends Equatable {
  final int lastPlayedSongIndex;
  const GetLastPlayedAudioState({
    required this.lastPlayedSongIndex,
  });

  factory GetLastPlayedAudioState.initial() {
    return const GetLastPlayedAudioState(lastPlayedSongIndex: 0);
  }

  @override
  List<Object?> get props => [lastPlayedSongIndex];

  @override
  String toString() => 'TodoSearchState(searchTerm: $lastPlayedSongIndex)';

  GetLastPlayedAudioState copyWith({
    int? lastPlayedSongIndex,
  }) {
    return GetLastPlayedAudioState(
      lastPlayedSongIndex: lastPlayedSongIndex ?? this.lastPlayedSongIndex,
    );
  }
}
