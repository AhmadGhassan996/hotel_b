import 'dart:convert';

import 'package:hotel_b/models/hotels_model.dart';
import 'package:hotel_b/screens/hotel_screen/wigets/siliver_app_bar.dart';
import 'package:hotel_b/services/hotel_api.dart';
import 'package:http/http.dart';

class HotelsService {
  HotelApi _hotelApi = HotelApi();

  Future<List<HotelsModel>> getAllHotels() async {
    List<HotelsModel> temp = [];

    var res = await _hotelApi.get(url: 'madaba.json') as Map<String, dynamic>;


    for (var x in res.keys) {
      temp.add(HotelsModel.formJson(res[x], x));
    }
    return temp;
  }

  Future<List<HotelsModel>> getAllHotelss(String madaba) async {
    List<HotelsModel> temp = [];

    var res =await get(Uri.parse(
        'https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/city/$madaba.json'));

var stringJson= json.decode(res.body)as Map<String,dynamic>;
    for (var x in stringJson.keys) {
      temp.add(HotelsModel.formJson(stringJson[x], x));
    }
    return temp;
  }

}