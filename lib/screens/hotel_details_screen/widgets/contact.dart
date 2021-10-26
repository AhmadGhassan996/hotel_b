import 'package:flutter/material.dart';
import 'package:hotel_b/screens/map_screen/map_screen.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 320,
        child: Column(
          children: [
            Text(
              'Contact',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),

            ),
            SizedBox(height: 10,),
            //
            // TextButton(onPressed: () {
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (ctx) => GoogleMapWidget(index: index)));
            // }, child: Text('aadsd')),
            GoogleMapWidget(index: index),

            Text(
              'Phone:99999999',
              style: TextStyle(
                  fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),

            ),
            SizedBox(height: 10,),
            Text(
              'Email: hotel@gmail.com',
              style: TextStyle(
                  fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),

            ),

          ],
        ),
      ),
    );
  }
}
