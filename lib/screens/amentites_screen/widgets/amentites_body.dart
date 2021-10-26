import 'package:flutter/material.dart';

class AmenitiesBody extends StatelessWidget {
  const AmenitiesBody({Key? key,required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                width: 160,
                child: ListTile(
                  minVerticalPadding: 1,
                  minLeadingWidth: 1,
                  leading: Icon(Icons.wifi),
                  title: Text('Wi-Fi in lobby '),
                ),
              ),
              // SizedBox(width: screenQuery*.2 ,),
              Container(
                width: 160,
                child: ListTile(
                  leading: Icon(Icons.wifi),
                  title: Text('Wi-Fi in room'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                width: 160,
                child: ListTile(
                  minVerticalPadding: 1,
                  minLeadingWidth: 1,
                  leading: Icon(Icons.restaurant_menu),
                  title: Text('Restaurant'),
                ),
              ),
              // SizedBox(width: screenQuery*.2 ,),
              Container(
                width: 160,
                child: ListTile(
                  leading: Icon(Icons.local_parking),
                  title: Text('Parking'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                width: 160,
                child: ListTile(
                  minVerticalPadding: 1,
                  minLeadingWidth: 1,
                  leading: Icon(Icons.pets),
                  title: Text('Pets'),
                ),
              ),
              // SizedBox(width: screenQuery*.2 ,),
              Container(
                width: 160,
                child: ListTile(
                  leading: Icon(Icons.pool),
                  title: Text('Pool'),
                ),
              ),
            ],
          ),
       // TextButton(onPressed: () {}, child: Text('SEE MORE',style: TextStyle( color: Colors.lightBlueAccent),),
       //
       //    ),
        ],
      ),
    );
  }
}
