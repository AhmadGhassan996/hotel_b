import 'package:flutter/material.dart';
import 'package:hotel_b/providers/favorites_provider.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:hotel_b/screens/hotel_details_screen/hotel_details.dart';
import 'package:provider/provider.dart';
class BodyAfter extends StatelessWidget {
  final int index;


  BodyAfter({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorite = context.watch<FVProvider>();


    return Container(
      width: 250,
      height: 250,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white70,
        elevation: 5,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image(
                    image: NetworkImage(favorite.hbResponse.data![index].img),
                    fit: BoxFit.cover,
                  ),
                  width: double.infinity,
                  height: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    favorite.hbResponse.data![index].name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: .5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 3),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 10,
                      ),
                      SizedBox(
                        width: .5,
                      ),
                      Text(
                        '2',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Text(
                        'km from center',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(

                      //  borderRadius: BorderRadius.circular(5),

                    ),
                    // margin: EdgeInsets.only(left: 5, right: 5),

                    width: 370,
                    height: 70,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: InkWell(
                        //  splashColor: Colors.grey,
                        // hoverColor: Colors.grey,
                        focusColor: Colors.grey,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(HotelDetailsScreen.namedRout);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'JOD${favorite.hbResponse.data![index].price} ',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    'per night',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '7 night for 200 JOD',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Text('View deals'),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}