import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mappls_gl/mappls_gl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is properly initialized

  try {
    MapplsAccountManager.setMapSDKKey("2b540a30f6ab86d001acc2c033b5b7a3"); // Replace with your actual API key
  } catch (e) {
    debugPrint("Error setting API key: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mappls Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapplsMapController? mapController;

  @override
  Widget build(BuildContext context) {
    // Check if the platform is supported
    if (!(Platform.isAndroid || Platform.isIOS)) {
      return Scaffold(
        appBar: AppBar(title: Text("Mappls Map")),
        body: Center(
          child: Text(
            "Maps are not supported on this platform.",
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Mappls Map")),
      body: MapplsMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(28.6139, 77.2090), // Default: New Delhi
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
