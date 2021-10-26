import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_b/providers/hotels_provider.dart';
import 'package:hotel_b/screens/hotel_screen/hotel_screen.dart';
import 'package:provider/provider.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key, required this.index}) : super(key: key);
  static const String namedRout = '/google_map_widget';
  final int index;

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  // var currentLocation;
  Set<Marker> _marker = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _marker.add(Marker(
          infoWindow: InfoWindow(
            title: '',
          ),
          markerId: MarkerId('id'),
          position: LatLng(
              context.read<HotelsProvider>().hbResponse.data![widget.index].lat,
              context
                  .read<HotelsProvider>()
                  .hbResponse
                  .data![widget.index]
                  .lon)));
    });
  }

  GoogleMapController? googleMapController;

  @override
  // void initState() {
  //   Geolocator.getCurrentPosition().then((value) {
  //   //  currentLocation = value;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
     // width: 400,
      child: GoogleMap(
        markers: _marker,
        initialCameraPosition: CameraPosition(
            target: LatLng(
                context
                    .read<HotelsProvider>()
                    .hbResponse
                    .data![widget.index]
                    .lat,
                context
                    .read<HotelsProvider>()
                    .hbResponse
                    .data![widget.index]
                    .lon),
            zoom: 13),
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
