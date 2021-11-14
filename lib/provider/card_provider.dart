import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum CardStatus { like, dislike }

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
    _isDragging = false;

    final status = getStatus();

    if(status != null) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: status.toString().split('.').last.toUpperCase(),
        fontSize: 36,
      );
    }

    switch(status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      // case CardStatus.superLike:
      //   superLike();
      //   break;
      default:
        resetPosition();
    }

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
      'assets/seafood_ramen.png',
    ].reversed.toList();

    notifyListeners();
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    // final y = _position.dy;
    // final forceSuperLike = x.abs() < 20;
    final delta = 100;

    if(x >= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    }
    // else if(y <= -delta / 2 && forceSuperLike) {
    //   return CardStatus.superLike;
    // }
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  void dislike() async {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  // void superLike() async {
  //   _angle = 0;
  //   _position -= Offset(0, _screenSize.height);
  //   _nextCard();
  //
  //   notifyListeners();
  // }

  Future _nextCard() async {
    if(_assetImages.isEmpty) return;
    await Future.delayed(Duration(milliseconds: 200));
    _assetImages.removeLast();
    resetPosition();
  }
}