import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_b/providers/auth_provider.dart';
import 'package:hotel_b/screens/favorits_screen/favorits_screen.dart';
import 'package:hotel_b/screens/hotel_screen/hotel_screen.dart';
import 'package:hotel_b/screens/reservition_screen/reservation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
class Screens extends StatefulWidget {
  static const String namedRout='/screens';

  const Screens({Key? key}) : super(key: key);

  @override
  _ScreensState createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {

  saveUser()async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.setString('userId', context.read<AuthProvider>().isLogedIn);
    print(preferences.getString('userId'));
  }

@override
  void initState() {
    // TODO: implement initState

 Future.delayed(Duration (milliseconds: 5000)).then((value) => saveUser());
    super.initState();
  }





  final screens=[
     HotelScreen(),

    FavoritesScreen(),
    ReservationScreen(),
  ];
  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[ currentIndex],
      bottomNavigationBar: CurvedNavigationBar(items: [
        Icon(Icons.hotel_rounded,size: 20,color: Colors.black),
        Icon(Icons.favorite,size: 20,color: Colors.black,),
        Icon(Icons.check_box,size: 20,color: Colors.black,),
      ],
        onTap: ( index){

          setState(() {
            currentIndex=index;
          });
          print(currentIndex);
        },
        index: 0,
        height: 50,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.bounceInOut,
      ),

    );
  }
}
