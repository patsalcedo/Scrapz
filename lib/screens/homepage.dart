import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/components/home_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const <Widget>[
        HomeCard(
          name: "Kim Hyunjin",
          profileImg: 'assets/people/person_hyunjin.jpg',
          assetImg: 'assets/food/tteokbokki.jpg',
          recipeName: 'Tteokbokki',
        ),
        const SizedBox(height: 20),
        HomeCard(
          name: "Son Chaeyoung",
          profileImg: 'assets/people/chaeyoung.jpg',
          assetImg: 'assets/food/seafood_ramen.png',
          recipeName: 'Seafood Ramen',
        ),
        const SizedBox(height: 20),
        HomeCard(
          name: "Jeon Heejin",
          profileImg: 'assets/people/person_heejin.jpg',
          assetImg: 'assets/food/apple_oat_pancakes.jpg',
          recipeName: 'Apple Oat Pancakes',
        ),
      ],
    );
  }
}
