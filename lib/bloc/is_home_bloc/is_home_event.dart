part of 'is_home_bloc.dart';

sealed class IsHomeEvent extends Equatable {
  const IsHomeEvent();

  @override
  List<Object> get props => [];
}

class setCurrentWidgetEvent extends IsHomeEvent {
  final bool isHome;
  const setCurrentWidgetEvent({required this.isHome});

  @override
  List<Object> get props => [isHome];
}
