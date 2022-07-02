import 'package:flutter/material.dart';
import 'package:vart/components/constant/constants.dart';

class TitleContainer extends StatelessWidget {
  final String title;
  final double width;
  final double fontSize;
  final Color color;
  final TextAlign alignmentType;
  const TitleContainer(
      {Key? key,
      required this.title,
      this.width = 0.8,
      this.fontSize = 34,
      this.color = gBlack,
      this.alignmentType = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      child: Text(
        title,
        textAlign: alignmentType,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: fontSize, color: color),
      ),
    );
  }
}
