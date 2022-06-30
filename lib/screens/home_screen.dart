import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vart/screens/loading_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then(
              (value) {
                print('log out');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoadingPage(),
                  ),
                );
              },
            );
          },
          child: const Text('Log out'),
        ),
      ),
    );
  }
}
