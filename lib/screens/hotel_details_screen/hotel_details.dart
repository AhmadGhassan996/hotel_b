import 'package:flutter/material.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:hotel_b/screens/amentites_screen/amentites.dart';
import 'package:hotel_b/screens/amentites_screen/widgets/amentites_body.dart';
import 'package:hotel_b/screens/book_screen/book_screen.dart';
import 'package:hotel_b/screens/hotel_details_screen/widgets/contact.dart';
import 'package:hotel_b/screens/hotel_details_screen/widgets/description.dart';
import 'package:hotel_b/screens/hotel_details_screen/widgets/imges.dart';
import 'package:provider/provider.dart';

class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({Key? key, required this.index}) : super(key: key);
  int index;
  static const String namedRout = '/hotel_details_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(BookScreen.namedRout);
        },
        child: Container(
            width: 200,
            height: 40,
            child: Center(
                child: Text(
              '${context.read<HotelsProvider>().hbResponse.data![index].roomModel.r1.price} JOD',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ImagesSlider(
                index: index,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AmenitiesBody(index:index),

            SizedBox(height: 10,),

            Description(index: index,),
            SizedBox(height: 10,),

           Contact(index:index),


          ],
        ),
      ),
    );
  }
}
