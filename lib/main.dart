import 'package:flutter/material.dart';
import 'package:scrapz/themes/scrapz_theme.dart';
import 'package:scrapz/tinder_homepage.dart';
import 'package:provider/provider.dart';
import 'package:scrapz/provider/card_provider.dart';
import 'themes/scrapz_theme_cl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final theme = ScrapzTheme.light();

  @override
  Widget build(BuildContext context) {
    const title = 'Scrapz Homepage';
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: MaterialApp(
        title: 'Scrapz',
        home: const MyHomePage(title: title),
        theme: _kScrapzTheme,
      ),
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
  final theme = ScrapzTheme.light();
  String? _chosenValue1;
  String? _chosenValue2;
  String? _chosenValue3;
  String? _chosenValue4;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Find me a meal',
              style: theme.textTheme.headline1,
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
                    style: TextStyle(color: Colors.black),
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
              style: TextStyle(color: Colors.white),
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
                    style: TextStyle(color: Colors.black),
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
              style: TextStyle(color: Colors.white),
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
                    style: TextStyle(color: Colors.black),
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
              style: TextStyle(color: Colors.white),
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
                    style: TextStyle(color: Colors.black),
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
                  MaterialPageRoute(builder: (context) => TinderHomepage()),
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

final ThemeData _kScrapzTheme = _buildScrapzTheme();

ThemeData _buildScrapzTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: scrapzOrange,
        onPrimary: scrapzOrange,
        secondary: scrapzYellow,
        error: scrapzErrorRed,
      ),
      // textTheme: _buildScrapzTextTheme(base.textTheme),
      // textSelectionTheme: const TextSelectionThemeData(
      //   selectionColor: scrapzTeal,
      // ),
  );
}

// TextTheme _buildScrapzTextTheme(TextTheme base) {
//   return base.copyWith(
//     headline5: base.headline5!.copyWith(
//       fontWeight: FontWeight.w500,
//     ),
//     headline6: base.headline6!.copyWith(
//       fontSize: 18.0,
//     ),
//     caption: base.caption!.copyWith(
//       fontWeight: FontWeight.w400,
//       fontSize: 14.0,
//     ),
//     bodyText1: base.bodyText1!.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 16.0,
//     ),
//   ).apply(
//     fontFamily: 'Rubik',
//     displayColor: scrapzYellow,
//     bodyColor: scrapzOrange,
//   );
// }