import 'package:flutter/material.dart';
import 'package:vart/screens/location_adder/components/google_map.dart';

class MyLocations extends StatefulWidget {
  const MyLocations({Key? key}) : super(key: key);

  @override
  State<MyLocations> createState() => _MyLocationsState();
}

class _MyLocationsState extends State<MyLocations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomGoogleMap(),
      ],
    ));
  }
}
