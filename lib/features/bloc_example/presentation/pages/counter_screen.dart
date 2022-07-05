import 'package:di_example/features/bloc_example/presentation/manager/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 07/05/2022 at 09:28.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key,}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  var counterBloc = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterCubit, CounterState>(
        bloc: counterBloc,
        builder: (_,CounterState state) {
          return Center(
            child: Text(
            '${counterBloc.count}',
            style: Theme.of(context).textTheme.headline1,
          ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterBloc.decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }
}
