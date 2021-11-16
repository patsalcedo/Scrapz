import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/components/match_dropdown.dart';
import 'package:scrapz/themes/scrapz_theme_cl.dart';
import 'package:scrapz/screens/match_making_page.dart';

class MatchMakerHomepage extends StatefulWidget {
  const MatchMakerHomepage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MatchMakerHomepage> createState() => _MatchMakerHomepage();
}

class _MatchMakerHomepage extends State<MatchMakerHomepage> {
  List<String> duration = [
    '< 15 minutes',
    '30 minutes max',
    '1 hour max',
    '2 hours max'];

  List<String> ingredients = [
  'Eggs',
  'Bread',
  'Rice',
  'Pasta'];

  List<String> appliances = [
  'Oven',
  'Cooktop',
  'Rice cooker',
  'Slow cooker'];

  List<String> diet = [
  'Vegan',
  'Vegetarian',
  'Keto',
  'Paleo'];

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
            MatchDropdown(
                items: duration,
              hint: 'Time',
            ),
            MatchDropdown(
              items: ingredients,
              hint: 'Ingredients',
            ),
            MatchDropdown(
              items: appliances,
              hint: 'Appliances',
            ),
            MatchDropdown(
              items: diet,
              hint: 'Diet Type',
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