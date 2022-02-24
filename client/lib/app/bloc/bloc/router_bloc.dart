import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router_event.dart';
part 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(const RouterInitial()) {
    on<RouteChange>(_onRouteChange);
  }
  Future<void> _onRouteChange(
    RouteChange event,
    Emitter<RouterState> emit,
  ) async {
    if (state.currentRoute == event.newRoute) return;
    emit(state.copyWith(currentRoute: event.newRoute));
  }
}
