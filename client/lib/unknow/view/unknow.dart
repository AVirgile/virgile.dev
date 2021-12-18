import 'package:flutter/material.dart';

class Unkown extends StatelessWidget {
  const Unkown({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: Unkown());

  @override
  Widget build(BuildContext context) {
    return const UnkownForm();
  }
}

class UnkownForm extends StatelessWidget {
  const UnkownForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unkown'),
      ),
    );
  }
}
