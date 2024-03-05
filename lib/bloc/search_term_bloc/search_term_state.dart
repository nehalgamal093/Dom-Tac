part of 'search_term_bloc.dart';

class SearchTermState extends Equatable {
  final String searchTerm;
  const SearchTermState({
    required this.searchTerm,
  });

  factory SearchTermState.initial() {
    return const SearchTermState(searchTerm: '');
  }

  @override
  List<Object?> get props => [searchTerm];

  @override
  String toString() => 'TodoSearchState(searchTerm: $searchTerm)';

  SearchTermState copyWith({
    String? searchTerm,
  }) {
    return SearchTermState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
