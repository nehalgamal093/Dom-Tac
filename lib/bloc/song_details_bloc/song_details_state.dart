part of 'song_details_bloc.dart';

class SongDetailsState extends Equatable {
  final String title;
  final String artist;
  final int id;
  final int index;
  const SongDetailsState(
      {required this.title,
      required this.artist,
      required this.id,
      required this.index});

  factory SongDetailsState.initial() {
    return SongDetailsState(title: '', artist: '', id: 0, index: 0);
  }

  @override
  List<Object?> get props => [title, artist, id];

  SongDetailsState copyWith(
      {String? title, String? artist, int? id, int? index}) {
    return SongDetailsState(
        title: title ?? this.title,
        artist: artist ?? this.artist,
        id: id ?? this.id,
        index: index ?? this.index);
  }
}
