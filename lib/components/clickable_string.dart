import 'package:flutter/material.dart';

class ClickableString extends StatelessWidget {
  final String title;
  final double stringSize;
  final FontWeight stringThickness;
  final Color stringColor;
  final TextAlign alignmentType;
  final VoidCallback tap;
  const ClickableString(
      {Key? key,
      required this.title,
      required this.stringSize,
      required this.stringThickness,
      required this.stringColor,
      this.alignmentType = TextAlign.left,
      required this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              child: Text(
                title,
                textAlign: alignmentType,
                style: TextStyle(
                    fontWeight: stringThickness,
                    fontSize: stringSize,
                    color: stringColor),
              ),
            )),
        onTap: tap);
  }
}
