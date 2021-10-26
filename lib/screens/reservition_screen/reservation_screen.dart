
import 'package:flutter/material.dart';
import 'package:hotel_b/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ReservationScreen extends StatelessWidget {
  static const String namedRout='/reservation_screen';

  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: TextButton(onPressed:() async{
        SharedPreferences preferences= await SharedPreferences.getInstance();
        preferences.remove('userId');
        Navigator.pushNamed(context, LogInScreen.namedRout);
      },child: Text('reservation')),),),
    );
  }
}
