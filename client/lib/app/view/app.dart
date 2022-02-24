// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:client/app/bloc/bloc/router_bloc.dart';
import 'package:client/l10n/l10n.dart';
import 'package:client/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouterBloc(),
      child: BlocBuilder<RouterBloc, RouterState>(
        builder: (context, state) {
          // ignore: prefer_const_constructors
          return AppComponent();
        },
      ),
    );
  }
}

class AppComponent extends StatelessWidget {
  const AppComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Virgile Agnel',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(
          location: context.read<RouterBloc>().state.currentRoute,
        ),
      ),
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: HomeRouterDelegate(),
      routeInformationParser: HomeRouteInformationParser(),
    );
  }
}
