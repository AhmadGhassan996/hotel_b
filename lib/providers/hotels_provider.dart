

import 'package:flutter/cupertino.dart';
import 'package:hotel_b/models/hotels_model.dart';
import 'package:hotel_b/providers/general_provider.dart';
import 'package:hotel_b/services/hotel_respons.dart';
import 'package:hotel_b/services/hotels_service.dart';

class HotelsProvider with ChangeNotifier {
HotelsService hotelsService= HotelsService();
GeneralProvider generalProvider=GeneralProvider();
var citySelected= '';
HBResponse<List<HotelsModel>> hbResponse= HBResponse.fresh();
var isEmpty=1;
void getHotels()async{

  try
      {

        hbResponse= HBResponse.loading();
        print('provider:$citySelected');
        var res= await hotelsService.getAllHotelss(citySelected);
        hbResponse=HBResponse.completed(res);
        isEmpty=hbResponse.data!.length;

      }
      catch(ex){
    HBResponse.error("something went wrong");
      }
      finally{
    notifyListeners();
      }
}



}