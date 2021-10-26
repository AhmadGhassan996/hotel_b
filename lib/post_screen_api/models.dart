import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AddHotelToLocation {
  double lan,long;
  HotelApiPost hotelApi;

  AddHotelToLocation({required this.lan,required this.long, required this.hotelApi});

  Map<String,dynamic>tojson()=>{
    'lan':lan,
    "lon":long,
    'hotels':hotelApi.toJson(),
  };

}

class HotelApiPost {
  String name;
  String description;
  Facilities facilities;
  double longtud;
  double louted;
  String img;
  Rooms rooms;

  HotelApiPost(
      {required this.description,
        required this.facilities,
        required this.name,
        required this.img,
        required this.longtud,
        required this.louted,
        required this.rooms,});

  Map<String, dynamic> toJson() => {
    'name': this.name,
    'des': this.description,
    "lon": this.longtud,
    'lou': this.louted,
    'img':this.img,
    'fac': this.facilities.toJson(),
    'rooms':rooms.toJson()
  };
}

class Facilities {
  String f1;

  String f2;
  String f3;
  String f4;
  String f5;
  String f6;
  String f8;
  String f9;

  //Rooms rooms;

  Facilities({
    required this.f1,
    required this.f2,
    required this.f3,
    required this.f4,
    required this.f5,
    required this.f6,
    required this.f8,
    required this.f9,
    // required this.rooms
  });

  Map<String, dynamic> toJson() => {
    'f1': this.f1,
    'f2': this.f2,
    'f3': this.f3,
    'f4': this.f4,
    'f5': this.f5,
    'f6': this.f6,
    'f8': this.f8,
    'f9': this.f9,
  };
}

class Rooms {

  Map<String,RoomScention> rooms;
  Map<String,dynamic>toJson()=>
    Map.from(rooms).map((key, v) => MapEntry<String,dynamic>(key, v.toJson()));

  Rooms(this.rooms);
}

class RoomScention {
  String details;
  String img1, img2, img3, img4, img5;
  bool isItAvalbale;
  String price;
  bool isItRoom1, isItRoom2, isItRoom3, isItRoom4;

  RoomScention(
      {required this.details,
        required this.img1,
        required this.img2,
        required this.img3,
        required this.img4,
        required this.img5,
        required this.isItAvalbale,
        required this.isItRoom1,
        required this.isItRoom2,
        required this.isItRoom3,
        required this.isItRoom4,
      required this.price});

  Map<String,dynamic>toJson()=> {
    'img1':img1,
    'img2':img2,
    'img3':img3,
    'img4':img4,
    'det':details,
    'img5':img5,
    "r1":isItRoom1,
    "r2":isItRoom2,
    "r3":isItRoom3,
    "r4":isItRoom4,
    'free':isItAvalbale,
'price': price,

  };

}

class ToFireBase {
  Future<HotelApiPost?> hotelApi(
      HotelApiPost hotelApi,String lan,String lon) async {
    var respone = await post(
        Uri.parse(
            'https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/city/amman.json'),
        body: json.encode(
          hotelApi.toJson()));

    if (respone.statusCode == 200) {
      // return HotelApi.fromJson(json.decode(respone.body));
    }
    return null;
  }
}

// class HotelApiProivder with ChangeNotifier {
//   ToFireBase _authService = ToFireBase();
//   bool isLoading = false;
//   HotelApi? authData;
//
//   Future<void> toFirebase(
//       String email, String password, Facilities facilities) async {
//     isLoading = true;
//     notifyListeners();
//     authData = await _authService.hotelApi(email, password, facilities);
//     isLoading = false;
//     notifyListeners();
//   }
//}
