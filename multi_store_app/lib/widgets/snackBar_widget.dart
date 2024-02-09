import 'package:flutter/material.dart';

class ScaffoldMsgHandler {
  static void showSnackBar(var _scaffoldKey, String text, Color bgColor,
      {int duration = 2}) {
    _scaffoldKey.currentState!.clearSnackBars();
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: bgColor,
      duration: Duration(seconds: duration),
      showCloseIcon: true,
    ));
  }
}