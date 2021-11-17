import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scrapz/models/recipe.dart';
import 'package:scrapz/provider/card_provider.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final bool isFront;

  const RecipeCard({
    Key? key,
    required this.recipe,
    required this.isFront,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}


class _RecipeCardState extends State<RecipeCard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: widget.isFront ? buildFrontCard() : buildCard(),
  );

  Widget buildCard() => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.recipe.assetImage),
          fit: BoxFit.cover,
          alignment: const Alignment(-0.3, 0),
        ),
      ),
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              stops: [0.0, 0.2],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // const Spacer(),
                buildName(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );

  Widget buildFrontCard() => GestureDetector(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final provider = Provider.of<CardProvider>(context);
          final position = provider.position;
          final milliseconds = provider.isDragging ? 0 : 400;

          final center = constraints.smallest.center(Offset.zero);
          final angle = provider.angle * pi / 180;
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);

          return AnimatedContainer(
            duration: Duration(milliseconds: milliseconds),
            transform: rotatedMatrix..translate(position.dx, position.dy),
            curve: Curves.easeInOut,
            child: buildCard(),
          );
        },
      ),
        onPanStart: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.startPosition(details);
        },
        onPanUpdate: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.updatePosition(details);
        },
        onPanEnd: (details) {
          final provider = Provider.of<CardProvider>(context, listen: false);
          provider.endPosition();
        },
      );

  Widget buildName() => Column(
    children: [
      Text(
            widget.recipe.title,
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
      Text(
        widget.recipe.duration,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      )
    ],
  );
}