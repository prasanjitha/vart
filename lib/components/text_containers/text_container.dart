import 'package:flutter/material.dart';
import 'package:vart/components/constant/constants.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final double width;
  final double fsize;
  final double height;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign alignmentType;
  const TextContainer(
      {Key? key,
      required this.text,
      this.width = 0.8,
      this.alignmentType = TextAlign.center,
      this.fsize = 14,
      this.height = 1.5,
      this.color = gBlack,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.zero,
      width: size.width * width,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: height,
          fontFamily: 'Poppins',
          fontSize: fsize,
          fontWeight: fontWeight,
        ),
        textAlign: alignmentType,
      ),
    );
  }
}
