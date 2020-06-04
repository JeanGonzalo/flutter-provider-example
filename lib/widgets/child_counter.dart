import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/providers/counter_provider.dart';

class ChildCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build Child Counter");
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Consumer<CounterProvider>(
              builder: (_, provider, widget) {
                return Text("child counter => ${provider.counter}");
              },
            ),
            FlatButton(
              onPressed: () {
                counterProvider.reset();
              },
              child: Text("RESET"),
            ),
          ],
        )
        //Text("Child counter => ${counterProvider.counter}"),

        );
  }
}
