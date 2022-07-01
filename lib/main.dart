// import 'package:flutter/material.dart';
// import 'package:vart/screens/curd/add.dart';
// import 'package:vart/screens/curd/database.dart';
// import 'package:vart/screens/curd/view.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'screens/buyer/buyer_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'screens/authentication/loading_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const LoadingPage(),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({ Key? key,}) : super(key: key);

  

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Database db;
//   List docs = [];
//   initialise() {
//     db = Database();
//     db.initiliase();
//     // db.read().then((value) => {
//     //       setState(() {
//     //         docs = value;
//     //       })
//     //     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     initialise();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
//         title: const Text("Country"),
//       ),
//       body: ListView.builder(
//         itemCount: docs.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               onTap: () {
//                 Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 View(country: docs[index], db: db)))
//                     .then((value) => {
//                           if (value != null) {initialise()}
//                         });
//               },
//               contentPadding: EdgeInsets.only(right: 30, left: 36),
//               title: Text(docs[index]['name']),
//               trailing: Text(docs[index]['code']),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Add(db: db)))
//               .then((value) {
//             if (value != null) {
//               initialise();
//             }
//           });
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }



//image upload
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   FirebaseStorage storage = FirebaseStorage.instance;

//   // Select and image from the gallery or take a picture with the camera
//   // Then upload to Firebase Storage
//   Future<void> _upload(String inputSource) async {
//     final picker = ImagePicker();
//     XFile? pickedImage;
//     try {
//       pickedImage = await picker.pickImage(
//           source: inputSource == 'camera'
//               ? ImageSource.camera
//               : ImageSource.gallery,
//           maxWidth: 1920);

//       final String fileName = path.basename(pickedImage!.path);
//       File imageFile = File(pickedImage.path);

//       try {
//         // Uploading the selected image with some custom meta data
//         await storage.ref(fileName).putFile(
//             imageFile,
//             SettableMetadata(customMetadata: {
//               'uploaded_by': 'A bad guy',
//               'description': 'Some description...'
//             }));

//         // Refresh the UI
//         setState(() {});
//       } on FirebaseException catch (error) {
//         if (kDebugMode) {
//           print(error);
//         }
//       }
//     } catch (err) {
//       if (kDebugMode) {
//         print(err);
//       }
//     }
//   }

//   // Retriew the uploaded images
//   // This function is called when the app launches for the first time or when an image is uploaded or deleted
//   Future<List<Map<String, dynamic>>> _loadImages() async {
//     List<Map<String, dynamic>> files = [];

//     final ListResult result = await storage.ref().list();
//     final List<Reference> allFiles = result.items;

//     await Future.forEach<Reference>(allFiles, (file) async {
//       final String fileUrl = await file.getDownloadURL();
//       final FullMetadata fileMeta = await file.getMetadata();
//       files.add({
//         "url": fileUrl,
//         "path": file.fullPath,
//         "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
//         "description":
//             fileMeta.customMetadata?['description'] ?? 'No description'
//       });
//     });

//     return files;
//   }

//   // Delete the selected image
//   // This function is called when a trash icon is pressed
//   Future<void> _delete(String ref) async {
//     await storage.ref(ref).delete();
//     // Rebuild the UI
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton.icon(
//                     onPressed: () => _upload('camera'),
//                     icon: const Icon(Icons.camera),
//                     label: const Text('camera')),
//                 ElevatedButton.icon(
//                     onPressed: () => _upload('gallery'),
//                     icon: const Icon(Icons.library_add),
//                     label: const Text('Gallery')),
//               ],
//             ),
//             Expanded(
//               child: FutureBuilder(
//                 future: _loadImages(),
//                 builder: (context,
//                     AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     return ListView.builder(
//                       itemCount: snapshot.data?.length ?? 0,
//                       itemBuilder: (context, index) {
//                         final Map<String, dynamic> image =
//                             snapshot.data![index];

//                         return Card(
//                           margin: const EdgeInsets.symmetric(vertical: 10),
//                           child: ListTile(
//                             dense: false,
//                             leading: Image.network(image['url']),
//                             title: Text(image['uploaded_by']),
//                             subtitle: Text(image['description']),
//                             trailing: IconButton(
//                               onPressed: () => _delete(image['path']),
//                               icon: const Icon(
//                                 Icons.delete,
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }

//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }