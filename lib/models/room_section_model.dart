class RoomSectionModel {
  String details;
  String img1, img2, img3, img4, img5;
  bool isItAvalbale;
  String price;
  bool isItRoom1, isItRoom2, isItRoom3, isItRoom4;

  RoomSectionModel(
      {required this.details,
      required this.img1,
      required this.img2,
      required this.img3,
      required this.img4,
      required this.img5,
      required this.isItAvalbale,
      required this.price,
      required this.isItRoom1,
      required this.isItRoom2,
      required this.isItRoom3,
      required this.isItRoom4});

  factory RoomSectionModel.fromJson(Map<String, dynamic> json) {
    return RoomSectionModel(
        details: json['det'],
        img1: json['img1'],
        img2: json['img2'],
        img3: json['img3'],
        img4: json['img4'],
        img5: json['img5'],
        isItAvalbale: json['free'],
        price: json['price'],
        isItRoom1: json['r1'],
        isItRoom2: json['r2'],
        isItRoom3: json['r3'],
        isItRoom4: json['r4']);
  }
}
