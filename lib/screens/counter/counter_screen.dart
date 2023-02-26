import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/drawer/custom_drawer.dart';

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
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              switch (state.runtimeType) {
                case CounterResetState:
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Counter Reset'),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  break;
                case CounterIncrementState:
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      SnackBar(
                        content: Text('Incremented to ${state.counterValue}'),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  break;
                case CounterDecrementState:
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      SnackBar(
                        content: Text('Decremented to ${state.counterValue}'),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  break;
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.read<CounterBloc>().add(CounterDecrementEvent()),
                child: const Icon(Icons.exposure_minus_1),
              ),
              IconButton(
                onPressed: () => context.read<CounterBloc>().add(CounterResetEvent()),
                icon: const Icon(Icons.restore),
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
