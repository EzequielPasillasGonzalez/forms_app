import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: _Body(),
      floatingActionButton: _FloatingActionButton(),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {},
          heroTag: '1',
          child: const Text('+3'),
        ),

        FloatingActionButton(
          onPressed: () {},
          heroTag: '2',
          child: const Text('+2'),
        ),

        FloatingActionButton(
          onPressed: () {},
          heroTag: '3',
          child: const Text('+1'),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('Counter value: xxxx'));
  }
}
