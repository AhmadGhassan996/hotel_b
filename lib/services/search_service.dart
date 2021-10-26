import 'dart:convert';

import 'package:hotel_b/services/hotel_api.dart';
import 'package:http/http.dart';

class SearchService {
  // List<dynamic> names=[];
  HotelApi _hotelApi = HotelApi();

  // Future<dynamic> getSearch() async {
  //   List<dynamic> names = [];
  //   var response = await _hotelApi.get(url: '.json');
  //
  //   for (var x in response) {
  //     names.add(x);
  //   }
  //   return names;
  // }

  Future<dynamic> getAllNames() async {
    List<dynamic> temp = [];
    var res = await get(Uri.parse(
        'https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/city.json'));
    var allNames= json.decode(res.body);
    for (var x in allNames.keys){
      temp.add(x);
    }
   return temp;

  }
}
