import 'package:flutter/material.dart';

class DinnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: <Widget>[
          DinnerMenuItem(Text("Sup 1")),
          DinnerMenuItem(Text("Sup 2")),
          DinnerMenuItem(Text("Sup 3")),
          DinnerMenuItem(Text("Sup 4")),
          DinnerMenuItem(Text("Sup 5")),
          DinnerMenuItem(Text("Sup 6"))
        ],);
  }

}

class DinnerMenuItem extends StatelessWidget {
  const DinnerMenuItem(this.text);

  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: text,
    );
  }
}