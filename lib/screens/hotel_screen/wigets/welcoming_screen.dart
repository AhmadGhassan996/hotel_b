import 'package:flutter/material.dart';

class WelcomingScreen extends StatelessWidget {
  const WelcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text(
        "Search For Hotels ",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
      ),
    ));
  }
}
