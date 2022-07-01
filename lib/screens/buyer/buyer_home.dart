import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuyerHome extends StatelessWidget {
  const BuyerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference _productss =
        FirebaseFirestore.instance.collection('products');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(color: Color(0xFF707070), fontSize: 30),
        ),
      ),
      body: StreamBuilder(
        stream: _productss.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['price'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
