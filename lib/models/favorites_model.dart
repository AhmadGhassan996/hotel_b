import 'package:flutter/cupertino.dart';

class FVModel {
  String fId;
  String img;
  String price;
  String name;
  String id;
  String? userId;

  FVModel(
      {required this.img,
      required this.price,
      required this.name,
      required this.id,
      required this.userId,
      required this.fId});

   factory FVModel.fromJson(Map<String, dynamic> json,String id){
    return FVModel(img: json['img'], price: json['price'], name: json['name'], id: json['hId'], userId: json['uId'],fId: id);
  }

 Map<String,dynamic> toJson()=>{
     'img':img,
   'hId':id,
   'uId':userId,
   'name':name,
   'price':price,
 };
}
