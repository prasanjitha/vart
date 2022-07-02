import 'package:flutter/material.dart';
import 'package:vart/components/constant/constants.dart';
import 'package:vart/components/text_containers/text_container.dart';

class ShopCard extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final String rating;
  final bool isSelected;
  final bool isFavorite;
  final String type;
  final String selectedType;
  const ShopCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.duration,
      required this.rating,
      required this.isFavorite,
      required this.isSelected,
      required this.type,
      required this.selectedType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return type == selectedType
        ? GestureDetector(
            onTap: () => {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => FoodDetail(image)))
            },
            child: Container(
              height: size.height * 0.16,
              margin: EdgeInsets.only(
                  right: size.width * 0.05,
                  left: size.width * 0.05,
                  top: size.height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(blurRadius: 15, color: gLightGray)],
                color: gWhite,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.16,
                    width: size.width * 0.2,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected ? gPrimaryColor : gWhite,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(size.width * 0.01),
                      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    isSelected ? gPrimaryColor50 : gLightGray,
                                blurRadius: 20)
                          ]),
                      child: Hero(
                        tag: image,
                        child: Image.asset(
                          image,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.55,
                                      child: TextContainer(
                                          text: title,
                                          fsize: 20,
                                          fontWeight: FontWeight.bold,
                                          alignmentType: TextAlign.start),
                                    ),
                                    Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: gSecondaryColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.4,
                                child: TextContainer(
                                  text: duration,
                                  fsize: 14,
                                  color: gBlack50,
                                  alignmentType: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: size.width * 0.4,
                                child: TextContainer(
                                    text: rating,
                                    fsize: 18,
                                    fontWeight: FontWeight.w600,
                                    alignmentType: TextAlign.start)),
                            SizedBox(width: 30),
                            Container(
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: isSelected ? gRed : gPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )),
                              child: Icon(
                                isSelected
                                    ? Icons.delete_forever_outlined
                                    : Icons.add,
                                size: 20,
                                color: isSelected ? gWhite : gBlack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
