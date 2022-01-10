abstract class CounterState {}

class InitialCounterState extends CounterState {}

class LoadingCounterState extends CounterState {}

class SuccessCounterState extends CounterState {
  final int value;

  SuccessCounterState(this.value);
}

class ErrorCounterState extends CounterState {
  final String message;

  ErrorCounterState(this.message);
}
