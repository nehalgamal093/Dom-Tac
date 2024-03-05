// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_term_event.dart';
part 'search_term_state.dart';

class SearchTermBloc extends Bloc<SearchTermEvent, SearchTermState> {
  SearchTermBloc() : super(SearchTermState.initial()) {
    on<SetSearchTermEvent>((event, emit) {
      emit(state.copyWith(searchTerm: event.newSearchTerm));
    });
  }
}
