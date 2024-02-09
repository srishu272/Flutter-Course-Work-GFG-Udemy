import 'package:flutter/material.dart';

class MyAlertDialogBox {
  static void showMyAlertDialog({
    required BuildContext context,
    required String title,
    required String text,
    required Function() onPressingYes,
    required Function() onPressingNo
  }) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
                onPressed: onPressingYes,
                child: Text("Yes")),
            TextButton(
                onPressed: onPressingNo,
                child: Text("No")),
          ],
        ));
  }
}