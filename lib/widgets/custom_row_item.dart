import 'package:flutter/material.dart';

class CustomRowItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  const CustomRowItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20), // Image border
          child: SizedBox.fromSize(
            size: Size.fromRadius(78), // Image radius
            child: Image.network(
                imageUrl,
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2E41),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF808080),
              ),
            ),
          ],
        )
      ],
    );
  }
}
