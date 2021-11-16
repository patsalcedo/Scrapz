import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return DropdownButton<String>(
      focusColor: Colors.white,
      value: _chosenValue,
      style: const TextStyle(color: Colors.white),
      iconEnabledColor: Colors.black,
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      hint: Text(
        widget.hint,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      onChanged: (String? value) {
        setState(() {
          _chosenValue = value;
        });
      },
    );
  }
}