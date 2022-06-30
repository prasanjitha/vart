import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vart/screens/home_screen.dart';
import 'package:vart/screens/register_page.dart';
import 'package:vart/screens/reser_password_page.dart';
import 'package:vart/widgets/custom_button.dart';
import 'package:vart/widgets/custom_text_deild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                'Login',
                style: TextStyle(color: Color(0xFF707070), fontSize: 30),
              ),
              const SizedBox(
                height: 40.0,
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
                  icon: Icons.lock,
                  isPasswordType: true,
                  text: 'Password'),
              Padding(
                padding: const EdgeInsets.only(right: 0,top: 10.0,left: 250),
                child: InkWell(
                   onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResetPassword(),
                        ),
                      );
                    },
                  child: const Text('Forgot password',  style: TextStyle(color: Color(0xFF667EEA), fontSize: 16),
                  textAlign: TextAlign.end,),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              CustomColorButton(
                width: width,
                text: 'Sign In',
                tap: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextEdditingController.text,
                          password: _passwordTextEdditingController.text)
                      .then(
                    (value) {
                      showAlertDialog(context);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ).onError((error, stackTrace) {
                    showAlertDialog(context);

                    print("Error ${error.toString()}");
                  });
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an accout?',
                    style: TextStyle(color: Color(0xFF707070), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'sign Up',
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

  showAlertDialog(BuildContext context) {
    // set up the buttons

    Widget continueButton = TextButton(
      child: Text("ok"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Invalid login"),
      content:
          const Text("Invalid email address or password please check again."),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
