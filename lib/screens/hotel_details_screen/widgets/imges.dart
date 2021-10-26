import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:provider/provider.dart';

class ImagesSlider extends StatelessWidget {
  ImagesSlider({Key? key, required this.index}) : super(key: key);
 final int index;
  late List<String> listImages;

  @override
  Widget build(BuildContext context) {
    listImages = [
      context.read<HotelsProvider>().hbResponse.data![index].roomModel.r1.img1,
      context.read<HotelsProvider>().hbResponse.data![index].roomModel.r1.img2,
      context.read<HotelsProvider>().hbResponse.data![index].roomModel.r1.img3,
      context.read<HotelsProvider>().hbResponse.data![index].roomModel.r1.img4
    ];

    return CarouselSlider.builder(
      itemCount: listImages.length,
      itemBuilder: (ctx, idd, id) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                listImages[idd],
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
          height: 180,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
          autoPlayCurve: Curves.fastOutSlowIn),
    );
  }
}
