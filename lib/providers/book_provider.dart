
import 'package:flutter/cupertino.dart';
import 'package:hotel_b/models/book_model.dart';
import 'package:hotel_b/services/book_service.dart';
import 'package:hotel_b/services/hotel_respons.dart';

class BookProvider with ChangeNotifier{

  bool isLoading = true;
  BookService _bookService = BookService();
  HBResponse<List<BookModel>> hbResponse = HBResponse.fresh();


  void getFv(String? id) async {
    try {
      hbResponse = HBResponse.loading();
      var res = await _bookService.getBook( id);
      hbResponse = HBResponse.completed(res);
    } catch (ex) {
      HBResponse.error("something went wrong");
    } finally {
      notifyListeners();
    }
  }
}