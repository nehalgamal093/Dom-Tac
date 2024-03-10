part of 'get_track_list_bloc.dart';

sealed class GetTrackListEvent extends Equatable {
  const GetTrackListEvent();

  @override
  List<Object> get props => [];
}

class TrackListEvent extends GetTrackListEvent {}
