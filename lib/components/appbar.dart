import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrapz/components/custom_shape.dart';
import 'package:scrapz/themes/scrapz_theme.dart';

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
          toolbarHeight: 2000,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 1000,
              width: MediaQuery.of(context).size.width,
              color: scrapzOrange,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo/logo_white_carrot.png",
                      fit: BoxFit.contain,
                      height: 20,
                    ),
                    Image.asset(
                      "assets/logo/logo_white_name.png",
                      fit: BoxFit.contain,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
