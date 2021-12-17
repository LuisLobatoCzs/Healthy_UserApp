import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  MapboxMapController? mapController;

  final here = LatLng(18.991412, -98.201622);
  final styleMap = 'mapbox://styles/luislobato/ckxax6pem0cg514qphmlky3pe';
  final secret =
      'sk.eyJ1IjoibHVpc2xvYmF0byIsImEiOiJja3hhczl5c3Iwc2loMzBwZng0NW1sOTZ5In0.Ff4iMP7HdlTqY0Ao7etHRQ';

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: map(),
    );
  }

  MapboxMap map() {
    return MapboxMap(
      styleString: styleMap,
      accessToken: secret,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: here, zoom: 17),
    );
  }
}
