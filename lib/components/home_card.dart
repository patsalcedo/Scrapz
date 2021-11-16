import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/components/circle_image.dart';

class HomeCard extends StatefulWidget {
  final String name;
  final String profileImg;

  const HomeCard({
    Key? key,
    required this.name,
    required this.profileImg,
  }) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}


class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleImage(
                imageProvider: AssetImage(widget.profileImg),
                imageRadius: 28,
              ),
              const SizedBox(width: 5),
              Text(
                widget.name,
              ),
              const SizedBox(width: 120),
              Text(
                '5 mins ago',
              ),
            ],
          ),
          Text(
            'Tteokbokki',
          ),
          const SizedBox(height: 10),
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/food/tteokbokki.jpg'),
              ),
            ),
          ),
          Row(
            // Icon and number combo
            // text date posted
          ),
        ],
      ),
    );
  }
}