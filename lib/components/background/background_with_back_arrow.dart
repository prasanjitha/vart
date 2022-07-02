import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vart/components/constant/size_config.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig.init(context);
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(406)),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(81),
              ),
              width: getProportionateScreenWidth(300),
              child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return SigninScreen();
                    //     },
                    //   ),
                    // );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/icons_arrow_long_left.svg",
                    height: getProportionateScreenHeight(41),
                    allowDrawingOutsideViewBox: false,
                    fit: BoxFit.none,
                  ))),
          child,
        ],
      ),
    );
  }
}
