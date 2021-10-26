import 'package:hotel_b/models/room_section_model.dart';

class RoomModel {

  RoomSectionModel r1;
  RoomSectionModel r2;
  RoomSectionModel r3;
  RoomSectionModel r4;

  RoomModel(
      {required this.r1, required this.r2, required this.r3, required this.r4});

  factory RoomModel.fromJson(Map<String, dynamic>json){
    return RoomModel(r1: RoomSectionModel.fromJson(json['r1']),
        r2: RoomSectionModel.fromJson(json['r2']),
        r3: RoomSectionModel.fromJson(json['r3']),
        r4: RoomSectionModel.fromJson(json['r4']));
  }

// Map<String, RoomSectionModel> room;
//
// factory RoomModel.fromJson(Map<String, dynamic> json) {
//   return RoomModel(
//       room: Map.from(json['rooms']).map(
//           (key, value) => MapEntry<String, RoomSectionModel>(key, RoomSectionModel.fromJson(
//               json))));
// }


}
