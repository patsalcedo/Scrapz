import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier{
  List<String> _assetImages = [];
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;

  List<String> get assetImages => _assetImages;
  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  CardProvider() {
    resetUsers();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }
  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }
  void endPosition() {
    resetPosition();
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  void resetUsers() {
    _assetImages = <String>[
      'assets/cheesy_garlic_bread.jpg',
      'assets/shrimp_curry_rice.jpg',
      'seafood_ramen.png',
    ].reversed.toList();

    notifyListeners();
  }
}