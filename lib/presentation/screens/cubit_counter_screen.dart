import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget para utilizar Bloc
    return BlocProvider(
      // Definir cubit
      create: (_) => CounterCubit(),
      // Solo este widget tiene acceso al CounterCuibir
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        // 4° Manera de acceder al estado y no estar pendiente de todos los widgets como el codigo cometnado de arriba
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            // Una manera de acceder a los metodos
            onPressed: () => context.read<CounterCubit>().reset(),
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

  // Tercera manera de acceder al metodo
  void increaseCounterBy(BuildContext context, int value) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // Segunda manera de acceder a los metodos
    final counterState = context.read<CounterCubit>();

    return Column(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => counterState.increaseBy(3),
          heroTag: '1',
          child: const Text('+3'),
        ),

        FloatingActionButton(
          onPressed: () => increaseCounterBy(context, 2),
          heroTag: '2',
          child: const Text('+2'),
        ),

        FloatingActionButton(
          onPressed: () => increaseCounterBy(context, 1),
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
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text('Counter value: ${state.counter}');
        },
      ),
    );
  }
}
