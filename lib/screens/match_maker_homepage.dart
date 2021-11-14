import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/themes/scrapz_theme_cl.dart';
import 'package:scrapz/screens/match_making_page.dart';

class MatchMakerHomepage extends StatefulWidget {
  const MatchMakerHomepage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MatchMakerHomepage> createState() => _MatchMakerHomepage();
}

class _MatchMakerHomepage extends State<MatchMakerHomepage> {
  final theme = ScrapzTheme.dark();
  String? _chosenValue1;
  String? _chosenValue2;
  String? _chosenValue3;
  String? _chosenValue4;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Find me a meal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
            ),
            DropdownButton<String>(
              focusColor: Colors.white,
              value: _chosenValue1,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                '< 15 minutes',
                '30 minutes max',
                '1 hour max',
                '2 hours max',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: const Text(
                'Time',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (String? value) {
                setState(() {
                  _chosenValue1 = value;
                });
              },
            ),
            DropdownButton<String>(
              focusColor: Colors.white,
              value: _chosenValue2,
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                'Eggs',
                'Bread',
                'Rice',
                'Pasta',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: const Text(
                'Ingredients',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (String? value) {
                setState(() {
                  _chosenValue2 = value;
                });
              },
            ),
            DropdownButton<String>(
              focusColor: Colors.white,
              value: _chosenValue3,
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                'Oven',
                'Cooktop',
                'Rice cooker',
                'Slow cooker',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: const Text(
                'Appliances',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (String? value) {
                setState(() {
                  _chosenValue3 = value;
                });
              },
            ),
            DropdownButton<String>(
              focusColor: Colors.white,
              value: _chosenValue4,
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>[
                'Vegan',
                'Vegetarian',
                'Keto',
                'Paleo',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: const Text(
                'Diet Type',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (String? value) {
                setState(() {
                  _chosenValue4 = value;
                });
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MatchMaking()),
                );
              },
              child: const Text('Gimme food', style: TextStyle(
                color: Colors.white,
              )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFE6C19)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}