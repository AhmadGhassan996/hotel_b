


import 'package:flutter/cupertino.dart';
import 'package:hotel_b/main.dart';
import 'package:hotel_b/screens.dart';
import 'package:hotel_b/screens/book_screen/book_screen.dart';
import 'package:hotel_b/screens/favorits_screen/favorits_screen.dart';
import 'package:hotel_b/screens/hotel_screen/hotel_screen.dart';

import 'package:hotel_b/screens/login_screen/login_screen.dart';
import 'package:hotel_b/screens/login_screen/sign_up_screent.dart';
import 'package:hotel_b/screens/reservition_screen/reservation_screen.dart';

Map<String,WidgetBuilder> routs ={

LogInScreen.namedRout:(cxt)=>LogInScreen(),
  SignUpScreen.namedRout:(cxt)=>SignUpScreen(),

  HotelScreen.namedRout:(ctx)=>HotelScreen(),
  BookScreen.namedRout:(ctx)=>BookScreen(),
  FavoritesScreen.namedRout:(ctx)=>FavoritesScreen(),
  ReservationScreen.namedRout:(ctx)=>ReservationScreen(),
  MyApp.namedRout:(ctx)=>MyApp(),
  Screens.namedRout:(ctx)=>Screens(),

};

