import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String ACCESS_TOKEN =
        const String.fromEnvironment("MAPBOX_DOWNLOADS_TOKEN");

    print(ACCESS_TOKEN);

    final MapController controller = MapController();

    // Change as per your need

    // Define options for your camera
    // CameraOptions camera = CameraOptions(
    //     center: Point(coordinates: Position(-98.0, 39.5)),
    //     zoom: 2,
    //     bearing: 0,
    //     pitch: 0);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Mapbox Map'),
    //   ),
    //   // ignore: prefer_const_constructors
    //   body: MapWidget(
    //     cameraOptions: camera,
    //   ),
    // );
    return FlutterMap(
      options: MapOptions(
        initialCenter:
            LatLng(51.509364, -0.128928), // Center the map over London
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/{id}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
          additionalOptions: const {
            'id':'mapbox://styles/djo01/cm1oyahl500kh01qr0xe6dyuw', // Make sure this matches the correct map style ID
            'accessToken':'pk.eyJ1IjoiZGpvMDEiLCJhIjoiY20xb3h4eXZ1MTJoMzJpcXhhcnp6MnpxeCJ9.DOhf5ieSPJ7fSNRukS58Xw',
          },
        ),
      ],
    );
  }
}

class AppConstants {
  static const String mapBoxAccessToken =
      // 'pk.eyJ1IjoiZGpvMDEiLCJhIjoiY2xrN2c0bjNjMDh0azNncnRzOXpnZ3ZpOSJ9.0Xql4ABT60WUcpKac_DUpA';
      'pk.eyJ1IjoiZGpvMDEiLCJhIjoiY20xb3h4eXZ1MTJoMzJpcXhhcnp6MnpxeCJ9.DOhf5ieSPJ7fSNRukS58Xw';

  // static final theLocation = LatLng(46.823, 8.383); // Your location
}
