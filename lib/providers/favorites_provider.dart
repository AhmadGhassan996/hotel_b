import 'package:flutter/cupertino.dart';
import 'package:hotel_b/models/favorites_model.dart';
import 'package:hotel_b/services/favorites_service.dart';
import 'package:hotel_b/services/hotel_respons.dart';

class FVProvider with ChangeNotifier {
  bool isLoading = true;
  FVService _fvService = FVService();
  HBResponse<List<FVModel>> hbResponse = HBResponse.fresh();

  void getFv(String? id) async {
    try {
      hbResponse = HBResponse.loading();
      var res = await _fvService.getFavorites( id);
      hbResponse = HBResponse.completed(res);
    } catch (ex) {
      HBResponse.error("something went wrong");
    } finally {
      notifyListeners();
    }
  }
}
