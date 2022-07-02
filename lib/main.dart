import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vart/screens/authentication/loading_page.dart';
import 'package:vart/screens/location_adder/location_adder.dart';
import 'package:vart/screens/location_adder/my_locate.dart';

import 'screens/location_adder/components/google_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LocationAdder(),
    );
  }
}
