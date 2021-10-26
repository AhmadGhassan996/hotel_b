

import 'package:flutter/cupertino.dart';

class RoomSelectedProvider with ChangeNotifier {

 int roomSelected =1;
 void changeRoom( int number){
  roomSelected= number;
  notifyListeners();
 }


}