import 'package:flutter/material.dart';
import 'package:mappls_gl/mappls_gl.dart';

void main() {
  MapplsAccountManager.setMapSDKKey("2b540a30f6ab86d001acc2c033b5b7a3"); 
  runApp(MaterialApp(home: MapScreen()));
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapplsMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mappls Map")),
      body: MapplsMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(28.6139, 77.2090), 
          zoom: 12.0,
        ),
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
