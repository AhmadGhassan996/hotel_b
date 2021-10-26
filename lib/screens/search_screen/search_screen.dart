import 'package:flutter/material.dart';
import 'package:hotel_b/providers/general_provider.dart';
import 'package:hotel_b/providers/search_provider.dart';
import 'package:hotel_b/screens/search_screen/widgets/search_widget.dart';
import 'package:hotel_b/services/search_service.dart';

import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  Search({
    Key? key,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchService s = SearchService();

  @override
  void initState() {
    context.read<SearchProvider>().getAllNames();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watcher = context.watch<SearchProvider>();
    return GestureDetector(
      onTap: (){
        s.getAllNames();
        showSearch(
context: context,
delegate: SearchWidget(cityNames: watcher.hbResponse.data!));
      },
      child: Container(

        width: 150,
        height: 50,
        child: Column(
          children: [
            Text("Where:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 4,),
            Text('${context.read<GeneralProvider>().citySelected}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
// Container(
// padding: EdgeInsets.only(top: 10),
// height: 50,
// width: 300,
// child: TextField(
// decoration: InputDecoration(
// hintText: context.read<GeneralProvider>().citySelected,
// fillColor: Colors.white,
// filled: true,
// prefixIcon: IconButton(
// icon: Icon(Icons.search),
// onPressed: () {
// s.getAllNames();
// showSearch(
// context: context,
// delegate: SearchWidget(cityNames: watcher.hbResponse.data!));
// },
// ),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: BorderSide(color: Colors.grey),
// ),
// disabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: BorderSide(color: Colors.grey, width: 1),
// ),
// ),
// ),
// );
