import 'package:hotel_b/models/room_model.dart';

import 'facilites_model.dart';

class HotelsModel {
  String id;
  String name;
  String details;
  String img;
  double lat;
  double lon;

  RoomModel roomModel;
FacilitiesModel facilitiesModel;

  HotelsModel({
    required this.id,
    required this.img,
    required this.name,
    required this.details,
    required this.lat,
    required this.lon,
    required this.roomModel,
  required this.facilitiesModel,
  });

  factory HotelsModel.formJson(Map<String, dynamic> json, String id) {
    return HotelsModel(
      id: id,

      img: json['img'],
      name: json['name'],
      details: json['des'],
      lat: json['lou'],
      lon: json['lon'],
      roomModel: RoomModel.fromJson(json['rooms']),
     facilitiesModel: FacilitiesModel.fromJson(json['fac']),
    );
  }
}
