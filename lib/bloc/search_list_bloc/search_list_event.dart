part of 'search_list_bloc.dart';

sealed class SearchListEvent extends Equatable {
  const SearchListEvent();

  @override
  List<Object> get props => [];
}

class SearchedEvent extends SearchListEvent {
  final List<SongModel> searchedList;

  const SearchedEvent({required this.searchedList});

  @override
  String toString() =>
      'CalculateFilteredTodosEvent(filteredTodos: $searchedList)';
  @override
  List<Object> get props => [searchedList];
}

class GetListEvent extends SearchListEvent {}
