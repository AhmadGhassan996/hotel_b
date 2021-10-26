import 'package:flutter/material.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  const Description({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:350,
        height: 150,
        child: Column(
          children: [
            Text(
              'Description',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),

            ),
            SizedBox(height: 13,),

            Text(context.read<HotelsProvider>().hbResponse.data![index].details,style: TextStyle(fontSize: 15),),

          ],
        ),
      ),
    );
  }
}
