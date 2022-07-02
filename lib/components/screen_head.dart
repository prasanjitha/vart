import 'package:flutter/material.dart';

class ScreenHead extends StatelessWidget {
  final Widget headLeft;
  final Widget headMiddle;
  final Widget headRight;
  const ScreenHead({
    Key? key,
    required this.headLeft,
    required this.headMiddle,
    required this.headRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.053,
      width: size.width * 0.93,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: size.width * 0.37,
                child: Align(alignment: Alignment.centerLeft, child: headLeft)),
            Container(
                width: size.width * 0.1,
                child: Align(alignment: Alignment.center, child: headMiddle)),
            Container(
              width: size.width * 0.37,
              child: Align(alignment: Alignment.centerRight, child: headRight),
            )
          ]),
    );
  }
}
