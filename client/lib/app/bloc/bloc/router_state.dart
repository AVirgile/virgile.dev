part of 'router_bloc.dart';

class RouterState extends Equatable {
  const RouterState({required this.currentRoute});

  final String currentRoute;

  RouterState copyWith({
    String? currentRoute,
  }) {
    return RouterState(currentRoute: currentRoute ?? this.currentRoute);
  }

  @override
  List<Object> get props => [currentRoute];
}

class RouterInitial extends RouterState {
  const RouterInitial() : super(currentRoute: '/');
}
