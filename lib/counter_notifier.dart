import 'package:flutter/widgets.dart';

class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier() : super(0);

  counterIncrement() async {
    value++;
  }
}
