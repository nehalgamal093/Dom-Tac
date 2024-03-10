part of 'is_home_bloc.dart';

class IsHomeState extends Equatable {
  final bool isHome;
  const IsHomeState({required this.isHome});

  factory IsHomeState.initial() {
    return const IsHomeState(isHome: true);
  }

  @override
  List<Object?> get props => [isHome];

  IsHomeState copyWith({bool? isHome}) {
    return IsHomeState(
      isHome: isHome ?? this.isHome,
    );
  }
}
