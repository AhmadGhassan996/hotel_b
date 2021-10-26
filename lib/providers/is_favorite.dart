




import 'package:flutter/cupertino.dart';

class IsFav with ChangeNotifier{

  late bool isFav=false;
  void isPressed() {
    isFav = ! isFav;
    notifyListeners();
  }
}