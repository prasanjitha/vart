import 'package:flutter/material.dart';
import 'package:vart/screens/home_screen.dart';
import 'package:vart/screens/login_page.dart';
import 'package:vart/widgets/custom_button.dart';
import 'package:vart/widgets/custom_text_deild.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameTextEdditingController = TextEditingController();
  TextEditingController _emailTextEdditingController = TextEditingController();
  TextEditingController _passwordTextEdditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Signup',
                style: TextStyle(color: Color(0xFF707070), fontSize: 30),
              ),
              const SizedBox(
                height: 40.0,
              ),
              CustomTextFormFeild(
                  controller: _nameTextEdditingController,
                  icon: Icons.email,
                  isPasswordType: false,
                  text: 'Name'),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextFormFeild(
                  controller: _emailTextEdditingController,
                  icon: Icons.email,
                  isPasswordType: false,
                  text: 'Email'),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextFormFeild(
                  controller: _passwordTextEdditingController,
                  icon: Icons.email,
                  isPasswordType: true,
                  text: 'password'),
              const SizedBox(
                height: 60.0,
              ),
              CustomColorButton(
                width: width,
                text: 'Sign Up',
                tap: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailTextEdditingController.text,
                    password: _passwordTextEdditingController.text,
                  )
                      .then((value) {
                    print('Created new account');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an accout?',
                    style: TextStyle(color: Color(0xFF707070), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'sign in',
                      style: TextStyle(color: Color(0xFF707070), fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
