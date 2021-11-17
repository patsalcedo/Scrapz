import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/components/circle_image.dart';
import 'package:scrapz/themes/scrapz_theme_cl.dart';

class HomeCard extends StatefulWidget {
  final String name;
  final String profileImg;
  final String assetImg;
  final String recipeName;

  const HomeCard({
    Key? key,
    required this.name,
    required this.profileImg,
    required this.assetImg,
    required this.recipeName,
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
                style: ScrapzTheme.lightTextTheme.headline3,
              ),
              const Expanded(child: SizedBox(width: 80)),
              Text(
                '⏲ 5 mins',
                style: ScrapzTheme.lightTextTheme.bodyText2,
              ),
            ],
          ),
          Align(
            alignment: Alignment(-0.7, 0.6),
            child: Text(
              widget.recipeName,
              style: ScrapzTheme.lightTextTheme.headline2,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 180,
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
                fit: BoxFit.cover,
                image: AssetImage(widget.assetImg),
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