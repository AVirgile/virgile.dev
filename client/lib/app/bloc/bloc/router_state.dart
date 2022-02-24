part of 'router_bloc.dart';

class RouterState extends Equatable {
  const RouterState({required this.currentRoute, required this.triggerRebuild});

  final String currentRoute;
  final bool triggerRebuild;

  RouterState copyWith({
    String? currentRoute,
    bool? triggerRebuild,
  }) {
    return RouterState(
      currentRoute: currentRoute ?? this.currentRoute,
      triggerRebuild: triggerRebuild ?? this.triggerRebuild,
    );
  }

  @override
  List<Object> get props => [currentRoute, triggerRebuild];
}

class RouterInitial extends RouterState {
  RouterInitial() : super(currentRoute: Uri.base.path, triggerRebuild: false);
}
