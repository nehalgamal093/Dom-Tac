part of 'get_last_played_position_bloc.dart';

class GetLastPlayedPositionState extends Equatable {
  final int lastPlayedPosition;
  const GetLastPlayedPositionState({
    required this.lastPlayedPosition,
  });

  factory GetLastPlayedPositionState.initial() {
    return const GetLastPlayedPositionState(lastPlayedPosition: 0);
  }

  @override
  List<Object?> get props => [lastPlayedPosition];

  @override
  String toString() => 'TodoSearchState(searchTerm: $lastPlayedPosition)';

  GetLastPlayedPositionState copyWith({
    int? lastPlayedPosition,
  }) {
    return GetLastPlayedPositionState(
      lastPlayedPosition: lastPlayedPosition ?? this.lastPlayedPosition,
    );
  }
}
