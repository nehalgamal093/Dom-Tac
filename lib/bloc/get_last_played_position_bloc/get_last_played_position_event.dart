part of 'get_last_played_position_bloc.dart';

sealed class GetLastPlayedPositionEvent extends Equatable {
  const GetLastPlayedPositionEvent();

  @override
  List<Object> get props => [];
}

class LastPLayedPositionEvent extends GetLastPlayedPositionEvent {
  final int lastPlayedPosition;
  const LastPLayedPositionEvent({
    required this.lastPlayedPosition,
  });

  @override
  String toString() => 'SetSearchTermEvent(newSearchTerm: $lastPlayedPosition)';

  @override
  List<Object> get props => [lastPlayedPosition];
}
