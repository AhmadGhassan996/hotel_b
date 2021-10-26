import 'dart:convert';

import 'package:hotel_b/models/book_model.dart';
import 'package:http/http.dart';

class BookService{

  Future<List<BookModel>> getBook(String? id) async {
    List<BookModel> temp = [];

    var res =await get(Uri.parse(
        'https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/reservation/$id.json'));

    var stringJson= json.decode(res.body)as Map<String,dynamic>;
    for (var x in stringJson.keys) {
      temp.add(BookModel.fromJson(stringJson[x], x));
    }
    return temp;
  }

  Future<BookModel?> postBook(
      BookModel fv,String? id) async {
    var respone = await post(
        Uri.parse(
            'https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/reservation/$id.json'),
        body: json.encode(
            fv.toJson()));

    if (respone.statusCode == 200) {
      // return HotelApi.fromJson(json.decode(respone.body));
    }
    return null;
  }


}