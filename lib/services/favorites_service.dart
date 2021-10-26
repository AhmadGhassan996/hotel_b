

import 'dart:convert';

import 'package:hotel_b/models/favorites_model.dart';
import 'package:http/http.dart';

import 'hotel_api.dart';

class FVService{


  Future<List<FVModel>> getFavorites(String? id) async {
    List<FVModel> temp = [];

    var res =await get(Uri.parse(
        'https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/favorites/$id.json'));

    var stringJson= json.decode(res.body)as Map<String,dynamic>;
    for (var x in stringJson.keys) {
      temp.add(FVModel.fromJson(stringJson[x], x));
    }
    return temp;
  }

  Future<FVModel?> postFV(
      FVModel fv,String? id) async {
    var respone = await post(
        Uri.parse(
            'https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/favorites/$id.json'),
        body: json.encode(
            fv.toJson()));

    if (respone.statusCode == 200) {
      // return HotelApi.fromJson(json.decode(respone.body));
    }
    return null;
  }

  Future<void> removeFv({required String? uId,required String hId, required fId})async{

     await delete(Uri.parse('https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/favorites/$uId/$fId/$hId.json'));
  }

}