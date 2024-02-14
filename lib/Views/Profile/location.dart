
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class LocationMap extends StatefulWidget {
  const LocationMap({Key? key}) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  
   static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.0469, 102.1497),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        // onMapCreated: (GoogleMapController controller) {
        //   _controller.complete(controller);
        // },

      ),
      
    );
  }
}


