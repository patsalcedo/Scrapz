import 'package:flutter/material.dart';
import 'package:scrapz/themes/scrapz_theme.dart';
import 'match_maker_homepage.dart';

// 1
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    // TODO: Replace with homepage
    Container(color: Colors.purple),
    // TODO: Replace with Search/explore screen
    Container(color: Colors.green),
    const MatchMakerHomepage(title: 'Match Maker'),
    // TODO: Replace with Grocery List Screen
    Container(color: Colors.blue),
    // TODO: Replace with Profile Screen
    Container(color: Colors.yellow)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scrapz',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
          scrapzOrange,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,
              color: scrapzOrange,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined,
              color: scrapzOrange,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: scrapzOrange,
            ),
            label: 'Match',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined,
              color: scrapzOrange,),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: scrapzOrange,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}