// import 'package:flutter/material.dart';
// import 'package:grocerya/constant/constants.dart';
// import 'package:grocerya/components/rating_button_base.dart';
// import 'package:grocerya/constant/size_config.dart';

// class RatingButton extends StatelessWidget {
//   final int number;
//   final bool btnStatus;
//   const RatingButton({Key? key, this.number = 1, this.btnStatus = true})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return btnStatus == false
//         ? Row(
//             children: [
//               RatingButtonBase(
//                 number: number,
//                 iconColor: gPrimaryColor,
//                 buttonColor: gRButtonColor,
//               ),
//               SizedBox(
//                 width: getProportionateScreenWidth(9),
//               )
//             ],
//           )
//         : Row(
//             children: [
//               RatingButtonBase(
//                 number: number,
//                 fontColor: gPrimaryLightColor,
//                 iconColor: gPrimaryLightColor,
//                 buttonColor: gPrimaryColor,
//               ),
//               SizedBox(
//                 width: getProportionateScreenWidth(9),
//               )
//             ],
//           );
//   }
// }
