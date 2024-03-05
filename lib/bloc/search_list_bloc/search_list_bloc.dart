import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dom_tac_music_player/bloc/search_term_bloc/search_term_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'search_list_event.dart';
part 'search_list_state.dart';

class SearchListBloc extends Bloc<SearchListEvent, SearchListState> {
  SongsList songsList;
  final SearchTermBloc searchTermBloc;
  late StreamSubscription searchStreamSubscription;
  SearchListBloc({required this.searchTermBloc, required this.songsList})
      : super(SearchListState.initial()) {
    setSearchList() async {
      List<SongModel> songs = [];
      List<SongModel> songModel = await songsList.getLists();

      if (searchTermBloc.state.searchTerm.isNotEmpty) {
        songs = songModel
            .where((SongModel song) =>
                song.title
                    .toLowerCase()
                    .contains(searchTermBloc.state.searchTerm.toLowerCase()) ||
                song.artist!
                    .toLowerCase()
                    .contains(searchTermBloc.state.searchTerm.toLowerCase()))
            .toList();
      }
      add(SearchedEvent(searchedList: songs));
    }

    searchStreamSubscription =
        searchTermBloc.stream.listen((SearchTermState searchTermState) {
      setSearchList();
    });
    on<SearchedEvent>((event, emit) {
      emit(state.copyWith(songList: event.searchedList));
    });
    on<GetListEvent>((event, emit) async {
      await songsList.getLists();
    });
  }
}

class SongsList {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  Future<List<SongModel>> getLists() async {
    List<SongModel> query = await _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true);

    return query;
  }
}
