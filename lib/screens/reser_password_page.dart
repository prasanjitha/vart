import 'package:flutter/material.dart';
import 'package:vart/screens/login_page.dart';
import 'package:vart/widgets/custom_button.dart';
import 'package:vart/widgets/custom_text_deild.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextEdditingController = TextEditingController();
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
                'Reset password',
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
                height: 40.0,
              ),
              CustomColorButton(
                width: width,
                text: 'Reset',
                tap: () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(
                          email: _emailTextEdditingController.text)
                      .then((value) {
                    print('Created new account');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
