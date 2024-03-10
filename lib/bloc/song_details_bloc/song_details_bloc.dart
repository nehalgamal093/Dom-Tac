import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'song_details_event.dart';
part 'song_details_state.dart';

class SongDetailsBloc extends Bloc<SongDetailsEvent, SongDetailsState> {
  SongDetailsBloc() : super(SongDetailsState.initial()) {
    on<SongEvent>((event, emit) {
      emit(state.copyWith(
          title: event.title,
          artist: event.artist,
          id: event.id,
          index: event.index));
    });
  }
}
