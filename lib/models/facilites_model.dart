class FacilitiesModel {
  String f1, f2, f3, f4, f5, f6;

  FacilitiesModel(
      {required this.f1,
      required this.f2,
      required this.f3,
      required this.f4,
      required this.f5,
      required this.f6});

  factory FacilitiesModel.fromJson(Map<String, dynamic> json) {
    return FacilitiesModel(
        f1: json['f1'],
        f2: json['f2'],
        f3: json['f3'],
        f4: json['f4'],
        f5: json['f5'],
        f6: json['f6']);
  }
}
