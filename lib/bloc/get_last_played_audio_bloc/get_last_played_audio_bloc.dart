import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_last_played_audio_event.dart';
part 'get_last_played_audio_state.dart';

class GetLastPlayedAudioBloc
    extends Bloc<GetLastPlayedAudioEvent, GetLastPlayedAudioState> {
  GetLastPlayedAudioBloc() : super(GetLastPlayedAudioState.initial()) {
    on<LastPlayedIndexEvent>((event, emit) {
      emit(state.copyWith(lastPlayedSongIndex: event.lastPlayedIndex));
    });
  }
}
