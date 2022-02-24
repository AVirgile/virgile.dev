import 'package:client/app/bloc/bloc/router_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeForm();
  }
}

class HomeForm extends StatelessWidget {
  const HomeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salut'),
      ),
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 55),
          primary: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          context.read<RouterBloc>().add(
                const RouteChange(
                  newRoute: '/about',
                  rebuild: true,
                ),
              );
        },
        child: const Text(
          'Go to about',
        ),
      ),
    );
  }
}
