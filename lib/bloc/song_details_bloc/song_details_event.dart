part of 'song_details_bloc.dart';

sealed class SongDetailsEvent extends Equatable {
  const SongDetailsEvent();

  @override
  List<Object> get props => [];
}

class SongEvent extends SongDetailsEvent {
  String title;
  String artist;
  int id;
  int index;
  SongEvent(
      {required this.title,
      required this.artist,
      required this.id,
      required this.index});
  @override
  List<Object> get props => [title, artist, id, index];
}
