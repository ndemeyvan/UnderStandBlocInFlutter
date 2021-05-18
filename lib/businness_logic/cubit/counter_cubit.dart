import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));
  void increment(int value) => emit(CounterState(counterValue: state.counterValue+value,wasIncremented: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue-1,wasIncremented: false));

}
