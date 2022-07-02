import 'package:flutter/material.dart';
import 'package:vart/components/constant/constants.dart';
import 'package:vart/components/text_containers/text_field_container.dart';

class PasswordField extends StatelessWidget {
  final ValueSetter<String?> onSaved;
  const PasswordField({
    Key? key,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onSaved: onSaved,
       
        cursorColor: gPrimaryColor,
        decoration: InputDecoration(
          hintText: "Enter your password",
          suffixIcon: Icon(
            Icons.visibility,
            color: gPrimaryColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: gBlack50),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: gBlack),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: gBlack),
          ),
        ),
      ),
    );
  }
}
