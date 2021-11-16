import 'package:flutter/material.dart';
import 'package:scrapz/screens/explore_page.dart';
import 'package:scrapz/screens/homepage.dart';
import 'package:scrapz/screens/shopping_list.dart';
import 'package:scrapz/themes/scrapz_theme.dart';
import 'components/appbar.dart';
import 'screens/match_maker_homepage.dart';

// 1
class Hub extends StatefulWidget {
  const Hub({Key? key}) : super(key: key);

  @override
  _HubState createState() => _HubState();
}

class _HubState extends State<Hub> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    HomePage(),
    ExplorePage(),
    MatchMakerHomepage(title: 'Match Maker'),
    ShoppingList(),
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
      appBar: CustomAppBar(title: 'Scrapz'),
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