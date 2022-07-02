import 'package:flutter/material.dart';
import 'package:vart/components/constant/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool signin;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.signin = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          signin ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: gBlack),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            signin ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: gPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
