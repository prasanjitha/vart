import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
          title: const Text(
            'Admin Home',
            style: TextStyle(color: Color(0xFF707070), fontSize: 30),
          ),
        ),
        body: const Center(
          child: Text('under constructions'),
        ));
  }
}
