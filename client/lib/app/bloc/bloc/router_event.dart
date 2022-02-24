part of 'router_bloc.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();

  @override
  List<Object> get props => [];
}

class RouteChange extends RouterEvent {
  const RouteChange({required this.newRoute}) : super();

  final String newRoute;
}
