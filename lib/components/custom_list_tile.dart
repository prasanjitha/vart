import 'package:flutter/material.dart';
import 'package:vart/components/clickable_string.dart';
import 'package:vart/components/constant/constants.dart';
import 'package:vart/components/hidden_string.dart';

class CustomListTile extends StatefulWidget {
  final String field;
  final String fieldValue;
  final bool hideFieldValue;
  final bool switchAction;
  final bool switchParam;
  final String actionHint;
  final VoidCallback action;
  const CustomListTile(
      {Key? key,
      required this.field,
      this.fieldValue = '',
      this.hideFieldValue = false,
      this.switchAction = false,
      this.switchParam = false,
      this.actionHint = '',
      required this.action})
      : super(key: key);
  @override
  _CustomListTileState createState() =>
      _CustomListTileState(switchParam: this.switchParam);
}

class _CustomListTileState extends State<CustomListTile> {
  var switchSate;
  var switchParam;

  _CustomListTileState({required this.switchParam});

  @override
  void initState() {
    if (widget.switchParam) {
      switchSate = 'Enabled';
    } else {
      switchSate = 'Disabled';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.023,
          right: widget.switchAction ? size.width * 0.0 : size.width * 0.023),
      height: size.height * 0.0837,
      child: widget.switchAction
          ? SwitchListTile(
              title: Text(widget.field,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: gBlack50,
                  )),
              subtitle: Text(switchSate,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.black,
                  )),
              activeColor: Colors.white,
              activeTrackColor: gPrimaryColor,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.blueGrey[100],
              value: switchParam,
              onChanged: setFuncton,
            )
          : ListTile(
              title: Text(widget.field,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: gBlack50,
                  )),
              subtitle: widget.hideFieldValue
                  ? HiddenString(string: widget.fieldValue)
                  : Text(widget.fieldValue,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.black,
                      )),
              trailing: ClickableString(
                title: widget.actionHint,
                stringSize: 14,
                stringThickness: FontWeight.w700,
                stringColor: gPrimaryColor,
                tap: widget.action,
              ),
            ),
    );
  }

  void setFuncton(bool value) {
    setState(() {
      switchParam = value;
    });
    if (switchParam) {
      switchSate = 'Enabled';
    } else {
      switchSate = 'Disabled';
    }
    widget.action();
  }
}
