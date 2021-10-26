import 'package:flutter/material.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:hotel_b/providers/room_selected.dart';
import 'package:hotel_b/screens/hotel_screen/wigets/date_piker.dart';
import 'package:hotel_b/screens/hotel_screen/wigets/hotel_tile.dart';
import 'package:hotel_b/screens/hotel_screen/wigets/room_dialog.dart';
import 'package:hotel_b/screens/search_screen/search_screen.dart';

import 'package:hotel_b/screens/hotel_screen/wigets/welcoming_screen.dart';
import 'package:hotel_b/services/hotel_respons.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

class HotelSliverAppBar extends StatefulWidget {
  static const String namedRout = '/HotelSliver';

  // const HotelSliverAppBar({Key? key}) : super(key: key);

  @override
  _HotelSliverAppBarState createState() => _HotelSliverAppBarState();
}

class _HotelSliverAppBarState extends State<HotelSliverAppBar> {
  bool isInit = true;


  @override
  Widget build(BuildContext context) {
    var hotels = context.watch<HotelsProvider>();

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              floating: true,
              delegate: CustomSliverAppBarDelegate(expandedHeight: 150)),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, ind) {
             // print(hotels.isEmpty);

              return  hotels.hbResponse.status==Status.FRESH?Center(child: WelcomingScreen()):hotels.hbResponse.status == Status.LOADING
                  ? Center(
                      child: Lottie.network(
                          'https://assets6.lottiefiles.com/private_files/lf30_Pqu98w.json'),
                    )
                  : HotelTile(index: ind,numberOfRooms: context.watch<RoomSelectedProvider>().roomSelected,);
            },
                childCount: hotels.hbResponse.status == Status.LOADING
                    ? 1
                    : hotels.isEmpty),
          ),
        ],
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {

  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        //overflow: Overflow.visible,
        clipBehavior: Clip.none,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Search(),
                    VerticalDivider(
                      color: Colors.black,
                      width: 20,
                      thickness: 5,
                      endIndent: 10,
                      indent: 10,
                    ),

                    DatePicker(),
                  ],
                ),
Divider(
  thickness: 1,
  indent: 50,
  endIndent: 60,
),

                TextButton(
                  onPressed: () {
                    roomDialog(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${context.watch<RoomSelectedProvider>().roomSelected}'),
                      const SizedBox(width: 2,),
                      context.read<RoomSelectedProvider>().roomSelected==1? Text('Room'):Text('Rooms'),
                    ],
                  ),
                ),
                //TextButton(onPressed: () {}, child: Text('Search'))
              ],
            ),
          ),
        ],
      ),
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  @override
  double get maxExtent => 140;

  @override
  double get minExtent => kToolbarHeight + 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

