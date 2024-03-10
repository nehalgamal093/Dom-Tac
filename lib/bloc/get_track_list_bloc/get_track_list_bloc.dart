import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../services/get_track_list.dart';

part 'get_track_list_event.dart';
part 'get_track_list_state.dart';

class GetTrackListBloc extends Bloc<GetTrackListEvent, GetTrackListState> {
  SongsList songsList;
  GetTrackListBloc({required this.songsList})
      : super(GetTrackListState.initial()) {
    on<TrackListEvent>(
        (TrackListEvent event, Emitter<GetTrackListState> emit) async {
      try {
        List<SongModel> songs = await songsList.getLists();
        emit(state.copyWith(songList: songs, status: Status.loaded));
        print('Songs is ${songs}');
      } catch (e) {
        print(e);
        emit(state.copyWith(status: Status.error));
      }
    });
  }
}
