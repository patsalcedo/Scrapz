import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrapz/components/recipe_card.dart';
import 'package:scrapz/provider/card_provider.dart';

class MatchMaking extends StatefulWidget {
  @override
  _MatchMakingState createState() => _MatchMakingState();
}

class _MatchMakingState extends State<MatchMaking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: buildCards(),
        ),
      ),
    );
  }

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    // final assetImages = provider.assetImages;
    final recipes = provider.recipes;

    return recipes.isEmpty
    ? Center(
      child: ElevatedButton(
        child: Text('Restart'),
        onPressed: () {
          final provider =
              Provider.of<CardProvider>(context, listen: false);
          provider.resetUsers();
        },
      ))
    : Stack(
      children: recipes
          .map((recipe) => Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
              child: RecipeCard(
                recipe: recipe,
                isFront: recipes.last == recipe,
              )),
          const SizedBox(height: 16),
          // buildButtons(),
        ],
      ))
          .toList(),
    );
  }
}

