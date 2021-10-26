import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_b/models/auth_data.dart';
import 'package:hotel_b/models/favorites_model.dart';
import 'package:hotel_b/providers/favorites_provider.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:hotel_b/providers/is_favorite.dart';
import 'package:hotel_b/screens/favorits_screen/favorits_screen.dart';
import 'package:hotel_b/screens/hotel_details_screen/hotel_details.dart';
import 'package:hotel_b/services/favorites_service.dart';
import 'package:hotel_b/services/hotel_respons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelTile extends StatefulWidget {
  final int index;
  final int numberOfRooms;

  HotelTile({Key? key, required this.index, required this.numberOfRooms})
      : super(key: key);

  @override
  _HotelTileState createState() => _HotelTileState();
}

class _HotelTileState extends State<HotelTile> {
  bool togel = true;

  @override
  Widget build(BuildContext context) {
    var hotels = context.watch<HotelsProvider>();
    var fav = context.watch<FVProvider>();
    print('number of rooms ${widget.numberOfRooms}');

    return Container(
      key: ValueKey(widget.index),
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
                    image:
                        NetworkImage(hotels.hbResponse.data![widget.index].img),
                    fit: BoxFit.cover,
                  ),
                  width: double.infinity,
                  height: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    hotels.hbResponse.data![widget.index].name,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      HotelDetailsScreen(index:widget.index )));
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
                                    'JOD ${widget.numberOfRooms == 1 ? hotels.hbResponse.data![widget.index].roomModel.r1.price : widget.numberOfRooms == 2 ? hotels.hbResponse.data![widget.index].roomModel.r2.price : widget.numberOfRooms == 3 ? hotels.hbResponse.data![widget.index].roomModel.r3.price : hotels.hbResponse.data![widget.index].roomModel.r4.price}',
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
            Positioned(
              top: 1,
              right: 10,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent)),
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();

                  if (togel == true) {
                    FVService().postFV(
                        FVModel(
                            fId: '',
                            img: hotels.hbResponse.data![widget.index].img,
                            price: hotels.hbResponse.data![widget.index]
                                .roomModel.r1.price,
                            name: hotels.hbResponse.data![widget.index].name,
                            id: hotels.hbResponse.data![widget.index].id,
                            userId: preferences.getString('userId')),
                        preferences.getString('userId'));
                    context
                        .read<FVProvider>()
                        .getFv(preferences.getString('userId'));
                  }
                  setState(() {
                    togel = !togel;
                  });
                  if (togel == false) {
                    FVService().removeFv(
                        uId: preferences.getString('userId'),
                        hId: hotels.hbResponse.data![widget.index].id,
                        fId: fav.hbResponse.data![widget.index].fId);
                  }
                  print(togel);
                  print(context
                      .read<FVProvider>()
                      .hbResponse
                      .data![widget.index]
                      .fId);
                },
                child: Icon(
                  togel == true
                      ? Icons.favorite_border_outlined
                      : Icons.favorite,
                  size: 30,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
