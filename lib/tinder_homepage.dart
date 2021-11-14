import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrapz/components/recipe_card.dart';
import 'package:scrapz/provider/card_provider.dart';

class TinderHomepage extends StatefulWidget {
  @override
  _TinderHomepageState createState() => _TinderHomepageState();
}

class _TinderHomepageState extends State<TinderHomepage> {
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
    final assetImages = provider.assetImages;

    return assetImages.isEmpty
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
      children: assetImages
      .map((assetImage) => RecipeCard(
          assetImage: assetImage,
          isFront: assetImages.last == assetImage))
      .toList(),
    );
  }

}
//   String? _chosenValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       child: Column(
//         children: [
//           const Text('Find me a meal'),
//           Container(
//             padding: const EdgeInsets.all(0.0),
//             child: DropdownButton<String>(
//               focusColor: Colors.white,
//               value: _chosenValue,
//               style: TextStyle(color: Colors.white),
//               iconEnabledColor: Colors.black,
//               items: <String>[
//                 '< 15 minutes',
//                 '30 minutes max',
//                 '1 hour max',
//                 '2 hours max',
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(
//                     value,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 );
//               }).toList(),
//               hint: const Text(
//                 'Time',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500),
//               ),
//               onChanged: (String? value) {
//                 setState(() {
//                   _chosenValue = value;
//                 });
//               },
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('Gimme food'),
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(Colors.black38),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DropdownItem extends StatefulWidget {
//   @override
//   _DropdownItemState createState() => _DropdownItemState();
// }
//
// List<DropdownMenuItem<String>> get dropdownItems{
//   List<DropdownMenuItem<String>> menuItems = [
//     DropdownMenuItem(child: Text("USA"),value: "USA"),
//     DropdownMenuItem(child: Text("Canada"),value: "Canada"),
//     DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
//     DropdownMenuItem(child: Text("England"),value: "England"),
//   ];
//   return menuItems;
// }
//
// class _DropdownItemState extends State<DropdownItem> {
//   String selectedValue = "USA";
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//         value: selectedValue,
//         items: dropdownItems
//     );
//   }
// }
