// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location_permissions/location_permissions.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_geocoding/google_geocoding.dart';

// class CustomGoogleMap extends StatefulWidget {
//   static String text = '';
//   static Map<String, dynamic> data = {
//     "pickedPoint": const LatLng(7.6515, 80.6734),
//     "pickedAddress": ''
//   };
//   static bool isLocationPicked = true;
//   CustomGoogleMap({Key? key}) : super(key: key);

//   @override
//   _CustomGoogleMapState createState() => _CustomGoogleMapState();
// }

// class _CustomGoogleMapState extends State<CustomGoogleMap> {
//   var initPoint = const LatLng(7.6515, 80.6734);
//   late CameraPosition _cameraPosition;
//   late GoogleMapController _controller;

//   @override
//   void initState() {
//     _cameraPosition = CameraPosition(target: initPoint, zoom: 8.5);
//     getCurrentLocation();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: initPoint,
//         zoom: 13.0,
//       ),
//       mapType: MapType.normal,
//       onMapCreated: (GoogleMapController controller) {
//         _controller = (controller);
//         _controller
//             .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
//       },
//       myLocationEnabled: true,
//       myLocationButtonEnabled: true,
//       onCameraMove: (position) {
//         CustomGoogleMap.isLocationPicked = false;
//         CustomGoogleMap.data['pickedPoint'] = position.target;
//       },
//       onCameraIdle: completingPickedAddress,
//     );
//   }

//   getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     // ignore: unrelated_type_equality_checks
//     if (permission != PermissionStatus.granted) {
//       LocationPermission permission = await Geolocator.requestPermission();
//       // ignore: unrelated_type_equality_checks
//       if (permission != PermissionStatus.granted) getLocation();
//       return;
//     }
//     getLocation();
//   }

//   getLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       initPoint = new LatLng(position.latitude, position.longitude);
//       print("User Location = $initPoint");
//       _cameraPosition = CameraPosition(target: initPoint, zoom: 13.0);
//       // ignore: unnecessary_null_comparison
//       if (_controller != null)
//         _controller
//             .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
//     });
//   }

//   Future getCurrentAddress() async {
//     print('Triggering getCurrentAddress() method');

//     LatLng y = CustomGoogleMap.data['pickedPoint'];
//     print(LatLon(y.latitude, y.longitude));

//     var googleGeocoding =
//         GoogleGeocoding("AIzaSyB4xFMVkMRWaoTiax6CkUHput5HtdSfrus");
//     var response = await googleGeocoding.geocoding
//         .getReverse(LatLon(y.latitude, y.longitude));

//     var address = response!.results;

//     print(address?[0].formattedAddress);
//     CustomGoogleMap.data['pickedAddress'] = address?[0].formattedAddress;
//     return response.status;
//   }

//   void completingPickedAddress() {
//     getCurrentAddress();
//     CustomGoogleMap.isLocationPicked = true;
//   }
// }
