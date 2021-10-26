import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_b/screens/amentites_screen/widgets/amentites_body.dart';

class Amenities extends StatelessWidget {
  const Amenities({Key? key,required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    double widthScreen= MediaQuery.of(context).size.width ;
    return Scaffold(
      body: AmenitiesBody(index: index,),
    );
  }
}
