import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'is_home_event.dart';
part 'is_home_state.dart';

class IsHomeBloc extends Bloc<IsHomeEvent, IsHomeState> {
  IsHomeBloc() : super(IsHomeState.initial()) {
    on<setCurrentWidgetEvent>((event, emit) {
      emit(state.copyWith(isHome: event.isHome));
    });
  }
}
