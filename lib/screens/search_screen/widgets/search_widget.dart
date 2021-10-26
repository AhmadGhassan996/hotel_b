import 'package:flutter/material.dart';
import 'package:hotel_b/providers/general_provider.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:hotel_b/screens/hotel_screen/hotel_screen.dart';
import 'package:hotel_b/services/search_service.dart';
import 'package:provider/provider.dart';


import '../../../screens.dart';
class SearchWidget extends SearchDelegate {
  List cityNames;

  SearchWidget({required this.cityNames});

  SearchService s = SearchService();

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [Icon(Icons.clear)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    return HotelScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    var searchList;
    searchList = query.isEmpty
        ? '1'
        : cityNames
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    var number=0;

    return ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Icon(Icons.description),
            title: Text(searchList[index]),
            onTap: () {
             context.read<GeneralProvider>().citySelected=searchList[index];
             context.read<HotelsProvider>().citySelected=searchList[index];
    context.read<HotelsProvider>().getHotels();
    Navigator.of(context).pushNamed(Screens.namedRout);
            },
          );
        });
  }
}
