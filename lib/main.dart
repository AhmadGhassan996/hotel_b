import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_b/post_screen_api/hotel_post_screen.dart';
import 'package:hotel_b/post_screen_api/models.dart';
import 'package:hotel_b/providers/auth_provider.dart';
import 'package:hotel_b/providers/favorites_provider.dart';
import 'package:hotel_b/providers/general_provider.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:hotel_b/providers/is_favorite.dart';
import 'package:hotel_b/providers/room_selected.dart';
import 'package:hotel_b/providers/search_provider.dart';
import 'package:hotel_b/routs.dart';
import 'package:hotel_b/screens.dart';
import 'package:hotel_b/screens/book_screen/book_screen.dart';
import 'package:hotel_b/screens/login_screen/sign_up_screent.dart';


import 'screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  static const String namedRout='/main';
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



var currentIndex=0;
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
ChangeNotifierProvider(create: (ctx)=>HotelsProvider()),
        ChangeNotifierProvider(create: (ctx) => SearchProvider()),
ChangeNotifierProvider(create: (ctx)=>RoomSelectedProvider()),
        ChangeNotifierProvider(create: (ctx)=>FVProvider()),
        Provider(create: (ctx)=> GeneralProvider()),
        ChangeNotifierProvider(create: (ctx)=>IsFav()),
        //ChangeNotifierProvider(create: (ctx)=>HotelApiProivder() ,

        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.red,
        ),
        home:LogInScreen(),


        routes: routs,
      ),
    );
  }
}





