import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: true,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EXCLUDESEMANTICS'),
          backgroundColor: Colors.teal,
        ),
        body: BlockSemantics(),
      ),
    );
  }
}

class SemanticsExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SemanticsExampleState();
  }
}

class _SemanticsExampleState extends State<SemanticsExample> {
  bool _isChecked = false;
  int _counter = 0;

  void _increaseCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Semantics(
              label: 'Counter button',
              hint: 'Press to increase',
              value: '$_counter',
              onTap: () {
                setState(() {
                  _counter++;
                });
              },
              child: ExcludeSemantics(
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display2,
                ),
              ),
            )
          ],
        ));
  }
}
