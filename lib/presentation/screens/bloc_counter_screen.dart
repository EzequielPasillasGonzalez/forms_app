import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) =>
              Text('Bloc Counter ${counterBloc.state.transactionCount}'),
        ),
        actions: [
          IconButton(
            onPressed: () => resetCounter(context),
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

  void increasedCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => increasedCounterBy(context, 3),
          heroTag: '1',
          child: const Text('+3'),
        ),

        FloatingActionButton(
          onPressed: () => increasedCounterBy(context, 2),
          heroTag: '2',
          child: const Text('+2'),
        ),

        FloatingActionButton(
          onPressed: () => increasedCounterBy(context),
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
    return Center(
      child: context.select(
        (CounterBloc counterBloc) =>
            Text('Counter value: ${counterBloc.state.counter}'),
      ),
    );
  }
}
