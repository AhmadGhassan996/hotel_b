import 'package:flutter/material.dart';
import 'package:hotel_b/providers/general_provider.dart';
import 'package:hotel_b/providers/room_selected.dart';
import 'package:provider/provider.dart';

void roomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => SimpleDialog(
      title: const Text('pick room'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                context.read<RoomSelectedProvider>().changeRoom(1);
                Navigator.pop(context);
              },
              child: Text(
                '1',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<RoomSelectedProvider>().changeRoom(2);
                Navigator.pop(context);
              },
              child: Text(
                '2',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<RoomSelectedProvider>().changeRoom(3);
                Navigator.pop(context);
              },
              child: Text(
                '3',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<RoomSelectedProvider>().changeRoom(4);
                Navigator.pop(context);
              },
              child: Text(
                '4',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
//
// SimpleDialogOption(
// onPressed: () {
// context.read<RoomSelectedProvider>().changeRoom(1);
// // print(context.read<RoomSelectedProvider>().roomSelected);
// Navigator.pop(context);
// },
// child: Text('1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
// ),
// SimpleDialogOption(
// //padding: EdgeInsets.all(50),
// onPressed: () {
// context.read<RoomSelectedProvider>().changeRoom(2);
// //print(context.read<RoomSelectedProvider>().roomSelected);
// Navigator.pop(context);
// },
// child: Text('2',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
// ),
// SimpleDialogOption(
// onPressed: () {
// context.read<RoomSelectedProvider>().changeRoom(3);
// //   print(context.read<RoomSelectedProvider>().roomSelected);
// Navigator.pop(context);
// },
// child: Text('3',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
// ),
// SimpleDialogOption(
// onPressed: () {
// context.read<RoomSelectedProvider>().changeRoom(4);
// // print(context.read<RoomSelectedProvider>().roomSelected);
// Navigator.pop(context);
// },
// child: Text('4',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
// ),
