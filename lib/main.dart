import 'package:flutter/material.dart';

import 'counter_notifier.dart';
import 'counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterNotifier = CounterNotifier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<CounterState>(
              valueListenable: counterNotifier,
              builder: (context, state, child) {
                if (state is LoadingCounterState) {
                  return const CircularProgressIndicator();
                } else if (state is SuccessCounterState) {
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state is ErrorCounterState) {
                  return Text('Erro: {$state.message}');
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterNotifier.counterIncrement,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
