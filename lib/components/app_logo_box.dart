import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoBox extends StatelessWidget {
  final String iconPath;
  final double iconHeight;
  final double iconWidth;

  const AppLogoBox({
    Key? key,
    required this.iconPath,
    required this.iconHeight,
    required this.iconWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.contain,
        child: Container(
          height: iconHeight,
          width: iconWidth,
          child: SvgPicture.asset(iconPath),
        ));
  }
}
