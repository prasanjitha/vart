import 'package:flutter/material.dart';

class HiddenString extends StatelessWidget {
  final String string;
  const HiddenString({
    Key? key,
    required this.string,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return buildHiddenstring(string, size.width * 0.015);
  }

  Widget buildHiddenstring(String text, double size) {
    List<Widget> dotArray = [];

    Widget dot = new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ));

    Widget space = new SizedBox(
      width: size * 0.37,
      height: size,
    );

    for (int i = 0; i < text.length; i++) {
      dotArray.add(dot);
      dotArray.add(space);
    }

    return Container(
      child: Row(
        children: dotArray,
      ),
    );
  }
}
