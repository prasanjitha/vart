import 'package:flutter/material.dart';
import 'package:vart/widgets/custom_button.dart';

import 'register_page.dart';
import 'select_possition.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60.0),
              const Text(
                'Welcome to Bolt',
                style: TextStyle(color: Color(0xFF707070), fontSize: 20),
              ),
              const Text(
                'Explore Us',
                style: TextStyle(color: Color(0xFF707070), fontSize: 18),
              ),
              const SizedBox(height: 80.0),
              Image.asset('assets/images/loading.png'),
              const SizedBox(height: 80.0),
              CustomColorButton(
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SelectPossition(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const SizedBox(
                  width: 245.0,
                  height: 49.0,
                  child: Center(
                    child: Text(
                      'Signup',
                      style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
