import 'package:flutter/material.dart';

class CustomColorButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback tap;
  const CustomColorButton({
    Key? key,
    this.width = 245.0,
    this.text="Log in",
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: width,
        height: 49.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF667EEA).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
          gradient: const LinearGradient(
              colors: [
                Color(0xFF667EEA),
                Color(0xFF64B6FF),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child:  Center(
          child: Text(
           text,
            style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
