import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/themes/scrapz_theme_cl.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text('My Shopping List',
                style: ScrapzTheme.lightTextTheme.headline1),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search...',
              ),
            ),
          ),
          ToggleSwitch(
            minWidth: 90.0,
            cornerRadius: 20.0,
            activeBgColors: const [[Colors.deepOrange], [Colors.deepOrange]],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.white,
            inactiveFgColor: Colors.black,
            initialLabelIndex: 1,
            totalSwitches: 2,
            borderWidth: 1.5,
            borderColor: const [Colors.deepOrange],
            labels: const ['Items', 'Completed'],
            radiusStyle: true,
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
        ],
      ),
    );
  }
}