import 'package:client/home/home.dart';
import 'package:client/unkown/unkown.dart';
import 'package:flutter/material.dart';

class HomeRoutePath {
  HomeRoutePath.home()
      : pathName = null,
        isUnkown = false;

  HomeRoutePath.otherPage(this.pathName) : isUnkown = false;

  HomeRoutePath.unKown()
      : pathName = null,
        isUnkown = true;

  final String? pathName;
  final bool? isUnkown;

  bool get isHomePage => pathName == null;
  bool get isOtherPage => pathName != null;
}

class HomeRouteInformationParser extends RouteInformationParser<HomeRoutePath> {
  @override
  Future<HomeRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return HomeRoutePath.home();
    }

    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0);
      //if (pathName == null) return HomeRoutePath.unKown();
      return HomeRoutePath.otherPage(pathName);
    }

    return HomeRoutePath.unKown();
  }

  @override
  RouteInformation? restoreRouteInformation(HomeRoutePath configuration) {
    if (configuration.isUnkown!) {
      return const RouteInformation(location: '/error');
    }
    if (configuration.isHomePage) return const RouteInformation(location: '/');
    if (configuration.isOtherPage) {
      return RouteInformation(location: '/${configuration.pathName}');
    }

    return null;
  }
}

class HomeRouterDelegate extends RouterDelegate<HomeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<HomeRoutePath> {
  String? pathName;
  bool isError = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  HomeRoutePath get currentConfiguration {
    if (isError) return HomeRoutePath.unKown();

    if (pathName == null) return HomeRoutePath.home();

    return HomeRoutePath.otherPage(pathName);
  }

  void onTapped(String path) {
    pathName = path;
    notifyListeners();
  }

  Widget pageHandle({String? pathName}) {
    if (pathName == null) return const Unkown();
    switch (pathName) {
      case 'about':
        return const Text('about');
      default:
        return const Unkown();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isError) {
      return const Unkown();
    }
    if (pathName != null) {
      return pageHandle(pathName: pathName);
    }
    // ignore: prefer_const_constructors
    return Home();
  }

  @override
  Future<void> setNewRoutePath(HomeRoutePath configuration) async {
    if (configuration.isUnkown!) {
      pathName = null;
      isError = true;
      return;
    }

    if (configuration.isOtherPage) {
      if (configuration.pathName != null) {
        pathName = configuration.pathName;
        isError = false;
        return;
      } else {
        isError = true;
        return;
      }
    } else {
      pathName = null;
    }
  }
}
