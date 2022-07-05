import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int count = 0;
  void increment() {
    emit(CounterInitial());
    count++;
    emit(CounterIncrement());
  }
  void decrement() {
    emit(CounterInitial());
    count--;
    emit(CounterDecrement());
  }
}
