// import 'package:flutter/material.dart';
// import 'package:grocerya/constant/size_config.dart';

// class RatingButtonBase extends StatelessWidget {
//   final int number;
//   final fontColor;
//   final iconColor;
//   final buttonColor;
//   const RatingButtonBase(
//       {Key? key,
//       required this.number,
//       this.fontColor = Colors.black,
//       required this.iconColor,
//       required this.buttonColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: getProportionateScreenWidth(51),
//       height: getProportionateScreenHeight(49),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5), color: buttonColor),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             number.toString(),
//             style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
//           ),
//           Icon(
//             Icons.star,
//             color: iconColor,
//             size: getProportionateScreenWidth(19),
//           )
//         ],
//       ),
//     );
//   }
// }
