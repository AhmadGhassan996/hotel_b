import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_b/main.dart';
import 'package:hotel_b/providers/room_selected.dart';

import 'package:hotel_b/screens/hotel_screen/wigets/hotel_tile.dart';
import 'package:hotel_b/screens/map_screen/map_screen.dart';
import 'package:hotel_b/screens/hotel_screen/wigets/siliver_app_bar.dart';
import 'package:provider/provider.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);
  static const String namedRout = '/hotel_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (ctx) => RoomSelectedProvider(), child: HotelSliverAppBar()),

      //HotelSliverAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //
      //     Navigator.of(context).pushNamed(GoogleMapWidget.namedRout);
      //   },
      //   child: Icon(Icons.arrow_forward_ios),

//          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)),
//       ),
    );
  }
}
