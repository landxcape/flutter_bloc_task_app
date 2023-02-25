import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  static const routeName = '/counterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is IncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Incremented to ${state.counterValue}'),
                    duration: const Duration(milliseconds: 300),
                  ),
                );
              } else if (state is DecrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Decremented to ${state.counterValue}'),
                    duration: const Duration(milliseconds: 300),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Text(
                'Counter Value: ${state.counterValue}',
                style: Theme.of(context).textTheme.titleLarge,
              );
            },
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => context.read<CounterBloc>().add(CounterDecrementEvent()),
                child: const Icon(Icons.exposure_minus_1),
              ),
              ElevatedButton(
                onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
                child: const Icon(Icons.exposure_plus_1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
