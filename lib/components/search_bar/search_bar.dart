import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vart/components/constant/constants.dart';
class SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBar({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.88,
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: gWhite,
          boxShadow: [
            BoxShadow(
              color: gLightGray,
              blurRadius: 10,
            )
          ]),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SvgPicture.asset("assets/icons/search.svg"),
          hintText: "Search Here",
          hintStyle: TextStyle(color: gLightGray),
        ),
      ),
    );
  }
}
