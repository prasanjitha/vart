import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vart/components/app_logo_box.dart';
import 'package:vart/components/background/background_with_back_arrow.dart';
import 'package:vart/components/clickable_icon.dart';
import 'package:vart/components/constant/size_config.dart';
import 'package:vart/components/rounded_button.dart';
import 'package:vart/components/screen_head.dart';
import 'package:vart/screens/location_adder/components/google_map.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig.init(context);
    return Background(
      child: Container(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(13),
              top: getProportionateScreenHeight(42),
              right: getProportionateScreenWidth(13)),
          child: Column(children: <Widget>[
            ScreenHead(
              headLeft: SizedBox(),
              headMiddle: SizedBox(),
              headRight: ClickableIcon(
                iconHeight: getProportionateScreenHeight(123),
                iconWidth: getProportionateScreenWidth(57),
                iconPath: "assets/icons/close.svg",
                tap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MenuScreen(),
                  //   ),
                  // );
                },
              ),
            ),
            Container(
              height: getProportionateScreenHeight(640),
              width: getProportionateScreenWidth(338),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CustomGoogleMap(),
                  Container(
                    padding: EdgeInsets.all(0.0),
                    height: getProportionateScreenHeight(108),
                    width: getProportionateScreenWidth(56),
                    alignment: Alignment.topCenter,
                    child: AppLogoBox(
                      iconHeight: getProportionateScreenHeight(60),
                      iconWidth: getProportionateScreenWidth(44),
                      iconPath: "assets/icons/map_marker.svg",
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: RoundedButton(
                text: 'Add another address',
                textSize: 15,
                press: () {
                  if (CustomGoogleMap.isLocationPicked == true) {
                    Timer(Duration(seconds: 1), () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => AddressForm(),
                    //       ));
                    // });
                    });
                  }
                },
                padVertical: 5,
                padHorizontal: 30,
              ),
            )
          ])),
    );
  }
}
