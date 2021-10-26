import 'dart:convert';

import 'package:http/http.dart' as http;

class HotelApi {
  String _baseUrl = 'https://hotel-f088b-default-rtdb.europe-west1.firebasedatabase.app/';

  Future<dynamic> get({required String url}) async {
    var responseJason;
    try {
      var response = await http.get(Uri.parse(_baseUrl + url));

      responseJason = _processedResponse(response);
    } catch (e) {
      return responseJason;
    }



    // Future<dynamic> post({required String url, required String body}) async {
    //   var responseJason;
    //
    //   try {
    //     var response = await http.post(
    //       Uri.parse(_baseUrl + url),
    //       body: body,
    //     );
    //
    //     responseJason = _processedResponse(response);
    //   } catch (e) {
    //     return responseJason;
    //   }
    // }
  }

  dynamic _processedResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonBody = json.decode(response.body);
        return jsonBody;

      case 500:
        throw Exception('something went wrong');
    }
  }
}
