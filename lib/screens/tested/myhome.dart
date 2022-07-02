import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  StreamController _controller = StreamController();
  addStreamData() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStreamData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyData(),
      builder: (BuildContext context, child) {
        return Scaffold(
          appBar: AppBar(
              title: Consumer<MyData>(
            builder: ((context, value, child) => Text(value.name)),
          )),
          body: ScreenTow(),
        );
      },

      // body: Column(
      //   children: [
      //     Text('data'),
      //     FloatingActionButton(onPressed: () {
      //       print('hellow');
      //     }),
      //     StreamBuilder(
      //         stream: addStreamData(),
      //         builder: (BuildContext context, AsyncSnapshot snapshot) {
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return CircularProgressIndicator.adaptive();
      //           } else {
      //             return Center(
      //               child: Text('${snapshot.data}',style: TextStyle(
      //                 color: Colors.black,fontSize: 25
      //               ),),
      //             );
      //           }
      //         })
      //   ],
      // ),
    );
  }
}

class ScreenTow extends StatelessWidget {
  const ScreenTow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('screen two');
    return Scaffold(
      body: ScreenThree(),
    );
  }
}

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('screen three');

    return Scaffold(
      body: ScreenFour(),
    );
  }
}

class ScreenFour extends StatelessWidget {
  const ScreenFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('screen four');

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Consumer<MyData>(
              builder: ((context, value, child) => Text(value.name)),
            ),
            RaisedButton(
              onPressed: () {
                context
                    .read<MyData>()
                    .changeName(Random().nextInt(100).toString());
              },
              child: Text('Hello'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyData extends ChangeNotifier {
  String _name = 'kamal';
  changeName(String name) {
    _name = name;
    notifyListeners();
  }

  String get name => _name;
}
