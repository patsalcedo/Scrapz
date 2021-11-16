import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double imageRadius;
  final ImageProvider? imageProvider;

  const CircleImage({
    Key? key,
    this.imageProvider,
    this.imageRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      // 4
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}