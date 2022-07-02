import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vart/components/constant/constants.dart';
import 'package:vart/components/text_containers/text_container.dart';

class CategoryCard extends StatelessWidget {
  final String selectedCategoryCardType;
  final String image;
  final String title;
  final String id;
  final Function(String) onIndexChange;
  CategoryCard(
      {required this.image,
      required this.title,
      required this.id,
      required this.selectedCategoryCardType,
      required this.onIndexChange});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {
        onIndexChange(id),
      },
      child: Container(
        width: size.width * 0.2,
        margin: EdgeInsets.only(right: 12, top: 10, bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selectedCategoryCardType == id ? gPrimaryColor : gWhite,
            boxShadow: [
              BoxShadow(
                color: gLightGray,
                blurRadius: 15,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(image, width: 40),
            TextContainer(
              text: title,
              fontWeight: FontWeight.w800,
              fsize: 13,
            ),
            RawMaterialButton(
                onPressed: null,
                fillColor:
                    selectedCategoryCardType == id ? gWhite : gSecondaryColor,
                shape: CircleBorder(),
                child: Icon(
                    selectedCategoryCardType == id
                        ? Icons.arrow_downward
                        : Icons.chevron_right_rounded,
                    size: 20,
                    color: selectedCategoryCardType == id ? gBlack : gWhite))
          ],
        ),
      ),
    );
  }
}
