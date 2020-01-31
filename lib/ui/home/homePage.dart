import 'package:flutter/material.dart';
import 'package:good_food/ui/menu/dinner/dinnerPage.dart';
import 'package:good_food/ui/theme/theme.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  DinnerPage dinnerPage = new DinnerPage();

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      dinnerPage,
      Text(
        'Index 1: FAQ',
        style: optionStyle,
      ),
      Text(
        'Index 2: Profile',
        style: optionStyle,
      ),
    ];

    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('MENU'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text('FAQ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('PROFILE'),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: PRIMARY_COLOR,
        onTap: _onItemTapped,
      ),
    );
  }

}