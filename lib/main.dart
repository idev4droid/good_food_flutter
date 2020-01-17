import 'package:flutter/material.dart';
import 'package:good_food/ui/home/homePage.dart';
import 'package:good_food/ui/theme/theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: PRIMARY_MATERIAL_COLOR,
        accentColor: SECONDARY_COLOR
      ),
      home: HomePage(),
    );
  }
}