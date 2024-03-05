part of 'search_term_bloc.dart';

sealed class SearchTermEvent extends Equatable {
  const SearchTermEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends SearchTermEvent {
  final String newSearchTerm;
  SetSearchTermEvent({
    required this.newSearchTerm,
  });

  @override
  String toString() => 'SetSearchTermEvent(newSearchTerm: $newSearchTerm)';

  @override
  List<Object> get props => [newSearchTerm];
}
