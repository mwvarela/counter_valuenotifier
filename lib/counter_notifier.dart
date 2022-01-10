import 'package:flutter/widgets.dart';

import 'counter_state.dart';

class CounterNotifier extends ValueNotifier<CounterState> {
  CounterNotifier() : super(InitialCounterState());
  int counter = 0;

  counterIncrement() async {
    value = LoadingCounterState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      counter = counter + 1;
      value = SuccessCounterState(counter);
    } catch (e) {
      value = ErrorCounterState('não somou');
    }
  }
}
