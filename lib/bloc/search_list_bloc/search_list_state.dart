part of 'search_list_bloc.dart';

class SearchListState extends Equatable {
  final List<SongModel> songList;

  const SearchListState({required this.songList});

  factory SearchListState.initial() {
    return const SearchListState(songList: []);
  }

  @override
  List<Object?> get props => [songList];

  SearchListState copyWith({List<SongModel>? songList}) {
    return SearchListState(songList: songList ?? this.songList);
  }
}
