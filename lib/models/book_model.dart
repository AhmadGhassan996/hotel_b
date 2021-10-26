import 'package:flutter/cupertino.dart';

class BookModel {
  String bId;
  String img;
  String price;
  String name;
  String id;
  String? userId;

  BookModel(
      {required this.img,
        required this.price,
        required this.name,
        required this.id,
        required this.userId,
        required this.bId});

  factory BookModel.fromJson(Map<String, dynamic> json,String id){
    return BookModel(img: json['img'], price: json['price'], name: json['name'], id: json['hId'], userId: json['uId'],bId: id);
  }

  Map<String,dynamic> toJson()=>{
    'img':img,
    'hId':id,
    'uId':userId,
    'name':name,
    'price':price,
  };
}
