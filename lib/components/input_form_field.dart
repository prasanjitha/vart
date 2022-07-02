import 'package:flutter/material.dart';
import 'package:vart/components/constant/constants.dart';
import 'package:vart/components/text_containers/text_field_container.dart';

class InputFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String?> onSaved;
 
  const InputFormField(
      {Key? key,
      this.hintText = "",
      this.icon = Icons.person,
      required this.onSaved,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onSaved: onSaved,
      
        cursorColor: gPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
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
