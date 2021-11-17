import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/themes/scrapz_theme_cl.dart';

class MatchDropdown extends StatefulWidget {
  final List<String> items;
  final String hint;

  const MatchDropdown(
  {Key? key,
    required this.items,
    required this.hint,
  }) : super(key: key);

  @override
  State<MatchDropdown> createState() => _MatchDropdownState();
}

class _MatchDropdownState extends State<MatchDropdown> {
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: DropdownButton<String>(
        isExpanded: true,
        focusColor: Colors.white,
        value: _chosenValue,
        style: const TextStyle(color: Colors.white),
        icon: Icon(
          Icons.arrow_drop_down_outlined,
          color: Colors.grey,
        ),
        iconEnabledColor: Colors.black,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: ScrapzTheme.lightTextTheme.headline3,
            ),
          );
        }).toList(),
        hint: Text(
          widget.hint,
          style: ScrapzTheme.lightTextTheme.headline3,
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
          });
        },
      ),
    );
  }
}