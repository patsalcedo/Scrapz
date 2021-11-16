import 'recipe.dart';

class RecipeRepository {
  static List<Recipe> loadRecipe() {
    const allRecipes = <Recipe> [
      Recipe(
        title: 'Cheesy Garlic Bread',
        duration: '15 mins',
        assetImage: 'assets/food/cheesy_garlic_bread.jpg',
        description: '',
      ),
      Recipe(
        title: 'Shrimp Curry Rice',
        duration: '30 mins',
        assetImage: 'assets/food/shrimp_curry_rice.jpg',
        description: '',
      ),
      Recipe(
        title: 'Seafood Ramen',
        duration: '25 mins',
        assetImage: 'assets/food/seafood_ramen.png',
        description: '',
      ),
      Recipe(
        title: 'Apple Oat Pancakes',
        duration: '60 mins',
        assetImage: 'assets/food/apple_oat_pancakes.jpg',
        description: '',
      ),
      Recipe(
        title: 'Cinnamon Apple Mug Cake',
        duration: '90 mins',
        assetImage: 'assets/food/cinnamon_apple_mugcake.PNG',
        description: '',
      ),
      Recipe(
        title: 'Tteokbokki',
        duration: '120 mins',
        assetImage: 'assets/food/tteokbokki.jpg',
        description: '',
      ),
    ];
    return allRecipes;
  }
}