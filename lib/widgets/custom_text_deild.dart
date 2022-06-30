import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;
  final bool isPasswordType;
  const CustomTextFormFeild({
    Key? key,
    required this.controller,
    required this.icon,
    required this.isPasswordType,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(fontSize: 18.0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const UnderlineInputBorder(),
        ),
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress);
  }
}
