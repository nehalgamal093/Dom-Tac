part of 'get_track_list_bloc.dart';

enum Status { loading, loaded, error, initial }

class GetTrackListState extends Equatable {
  final List<SongModel> songList;
  final Status status;
  const GetTrackListState({required this.songList, required this.status});

  factory GetTrackListState.initial() {
    return const GetTrackListState(songList: [], status: Status.initial);
  }

  @override
  List<Object?> get props => [songList, status];

  GetTrackListState copyWith({List<SongModel>? songList, Status? status}) {
    return GetTrackListState(
        songList: songList ?? this.songList, status: status ?? this.status);
  }
}
