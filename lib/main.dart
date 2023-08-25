import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plusminus/logic/cubit/counter_cubit.dart';
import 'package:plusminus/presentation/screens/home_screen.dart';
import 'package:plusminus/presentation/screens/second_screen.dart';
import 'package:plusminus/presentation/screens/third_screen.dart';

void main() {
  const CounterState counterState1 = CounterState(counterValue: 1);
  const CounterState counterState2 = CounterState(counterValue: 1);
  //!  THIS SHOULD RETURN TRUE NOW
  print(counterState1 == counterState2);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterCubit _counterCubit = CounterCubit();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const BlocProvider.value(
              value: BlocProvider.of<CounterCubit>(context),
              child: HomeScreen(
                title: 'Flutter Demo Home Page',
                colors: Colors.blueAccent,
              ),
            ),
        '/second': (context) => const SecondScreen(
              title: 'Flutter Demo Home Page',
              colors: Colors.redAccent,
            ),
        '/third': (context) => const ThirdScreen(
              title: 'Flutter Demo Home Page',
              colors: Colors.greenAccent,
            )
      },
    );
  }
}
