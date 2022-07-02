import 'package:flutter/material.dart';
import 'package:vart/components/constant/constants.dart';
import 'package:vart/components/constant/size_config.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final double textSize;
  final Color color, textColor;
  final double padVertical;
  final double padHorizontal;
  const RoundedButton(
      {Key? key,
      this.text = "",
      required this.press,
      this.color = gPrimaryColor,
      this.textSize = 18,
      this.textColor = Colors.white,
      this.padVertical = 10,
      this.padHorizontal = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(13)),
      width: getProportionateScreenWidth(315),
      height: getProportionateScreenHeight(56),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextButton(
          style: TextButton.styleFrom(
              primary: gPrimaryColor,
              padding: EdgeInsets.symmetric(
                  vertical: padVertical, horizontal: padHorizontal),
              backgroundColor: color),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
