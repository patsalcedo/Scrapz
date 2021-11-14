import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:scrapz/themes/scrapz_theme.dart';
import 'package:scrapz/themes/scrapz_theme_cl.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text('My Shopping List',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ),
        Padding(
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
          activeBgColors: [[Colors.deepOrange], [Colors.deepOrange]],
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.white,
          inactiveFgColor: Colors.black,
          initialLabelIndex: 1,
          totalSwitches: 2,
          borderWidth: 1.5,
          borderColor: [Colors.deepOrange],
          labels: ['Items', 'Completed'],
          radiusStyle: true,
          onToggle: (index) {
            print('switched to: $index');
          },
        ),
      ],
    );

    // return Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           'Shopping List',
    //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
    //         ),
    //         TextButton(
    //           onPressed: () {
    //             // Navigator.push(
    //             //   context,
    //             //   MaterialPageRoute(builder: (context) => MatchMaking()),
    //             // );
    //           },
    //           child: const Text('Gimme food', style: TextStyle(
    //             color: Colors.white,
    //           )),
    //           style: ButtonStyle(
    //             backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFE6C19)),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}