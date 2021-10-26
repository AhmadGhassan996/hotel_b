

import 'package:flutter/cupertino.dart';
import 'package:hotel_b/services/hotel_respons.dart';
import 'package:hotel_b/services/search_service.dart';


class SearchProvider with ChangeNotifier{

  SearchService searchService= SearchService();
  HBResponse hbResponse=HBResponse.fresh();

  void getAllNames()async{
    try{
      hbResponse=HBResponse.loading();
      var res=await searchService.getAllNames();
      hbResponse=HBResponse.completed(res);

    }catch(e){

    }
    finally{
      notifyListeners();
    }
  }

}