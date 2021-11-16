import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/components/custom_shape.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title
  }) : super(key: key);

  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 1500,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              color: Colors.deepOrange,
              child: Center(
                child: Text('Scrapz',
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            ),
          ),
        ),
    );
  }
}
