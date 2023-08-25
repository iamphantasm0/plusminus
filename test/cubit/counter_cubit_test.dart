import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plusminus/logic/cubit/counter_cubit.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    test('the initail state for CounterCubit is COunterState(countervalue:0)',
        () {
      expect(counterCubit.state, const CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue: 1) when increment is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [const CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue: -1) when decrement is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () =>
          [const CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
