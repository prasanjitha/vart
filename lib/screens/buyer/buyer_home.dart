import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vart/widgets/custom_column_item.dart';
import 'package:vart/widgets/custom_row_item.dart';

import '../../widgets/custom_carousel_slider.dart';

class BuyerHome extends StatelessWidget {
  const BuyerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference _productss =
        FirebaseFirestore.instance.collection('products');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
 
              Text(
                'Find Location',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2E41),
                ),
              ),
                SizedBox(
                height: 10.0,
              ),
              Text(
                'Look for a places you would like to visit ',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF808080),
                ),
              ),
              const SizedBox(
                height: 45.0,
              ),
              Material(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                elevation: 10.0,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    hintText: 'Search here',
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 25.0,
              // ),
              // CustomCarouselSlider(
              //   items: const [
              //     'https://24x7doctorsansweringservice.com/wp-content/uploads/2018/08/doctor-patient-communication.jpg',
              //     'https://previews.123rf.com/images/wavebreakmediamicro/wavebreakmediamicro1502/wavebreakmediamicro150217559/36421717-portrait-of-happy-patient-showing-thumbs-up-while-doctor-checking-his-blood-pressure-in-clinic.jpg',
              //     'https://cdn.pixabay.com/photo/2016/07/20/19/23/baby-1531059_960_720.jpg',
              //     'https://t3.ftcdn.net/jpg/00/97/18/72/360_F_97187265_FP54RyJ0XxPODqu7YvAcpy8z9CTmAP1G.jpg',
              //   ],
              // ),
              const SizedBox(
                height: 25.0,
              ),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomColumnItem(
                        imgUrl:
                            'https://cdn.pixabay.com/photo/2015/04/23/22/01/mountains-736886_960_720.jpg',
                        text: 'Canada'),
                    SizedBox(
                      width: 20,
                    ),
                    CustomColumnItem(
                        imgUrl:
                            'https://cdn.pixabay.com/photo/2021/10/11/11/12/countryside-6700296_960_720.jpg',
                        text: 'Iceland'),
                    SizedBox(
                      width: 20,
                    ),
                    CustomColumnItem(
                        imgUrl:
                            'https://cdn.pixabay.com/photo/2017/05/09/03/46/alberta-2297204_960_720.jpg',
                        text: 'Thailand'),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Text(
                'Most Popular',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F2E41),
                ),
              ),
                SizedBox(
                height: 20.0,
              ),
              CustomRowItem(
                imageUrl:
                    'https://cdn.pixabay.com/photo/2017/05/09/03/46/alberta-2297204_960_720.jpg',
                title: 'Blue Pond, Hokkaido',
                subTitle: 'by Jarrett Kow',
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomRowItem(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2022/06/21/21/56/konigssee-7276585_960_720.jpg',
                  title: 'Blue Pond, Hokkaido',
                  subTitle: 'by Jarrett Kow'),
            ],
          ),
        ),
      ),
    );
  }
}




//display data on firestroe databse
// StreamBuilder(
//           stream: _productss.snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//             if (streamSnapshot.hasData) {
//               return ListView.builder(
//                 itemCount: streamSnapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot documentSnapshot =
//                       streamSnapshot.data!.docs[index];
//                   return Card(
//                     margin:
//                         const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
//                     child: ListTile(
//                       title: Text(documentSnapshot['name']),
//                       subtitle: Text(documentSnapshot['price'].toString()),
//                       trailing: SizedBox(
//                         width: 100,
//                         child: Row(),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),