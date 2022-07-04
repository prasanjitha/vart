import 'package:flutter/material.dart';
import 'package:vart/screens/location/my_location.dart';
import 'package:vart/screens/location_adder/my_locate.dart';

class CustomColumnItem extends StatelessWidget {
  final String imgUrl;
  final String text;
  const CustomColumnItem({
    Key? key,
    required this.imgUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LocationAdderPageView(),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Align(
              widthFactor: 0.15,
              heightFactor: 0.30,
              child: Image.network(imgUrl, fit: BoxFit.fitHeight),
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
