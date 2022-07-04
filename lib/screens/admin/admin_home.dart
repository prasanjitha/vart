import 'package:flutter/material.dart';
import 'package:vart/screens/authentication/select_possition.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                 Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SelectPossition()
                    ),
                  );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'My Trips',
            style: TextStyle(color: Color(0xFF707070), fontSize: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'assets/images/one.png',
                width: 390,
                height: 350,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/two.png',
                width: 390,
                height: 350,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ));
  }
}
