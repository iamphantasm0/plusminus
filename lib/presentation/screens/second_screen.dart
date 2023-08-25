import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plusminus/logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title, required this.colors});

  final String title;
  final Color colors;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colors,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: Colors.black),
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else {
                  print('Erro');
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    "nagetive ${state.counterValue}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement;
                  },
                  tooltip: "Decreament",
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: "Increment",
                  child: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
