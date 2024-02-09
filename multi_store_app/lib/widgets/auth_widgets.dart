import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal)),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 25, color: Colors.white),
          )),
    );
  }
}

class HaveAccount extends StatelessWidget {
  final String haveAccount;
  final String actionText;
  final Function() onPressed;

  const HaveAccount({
    super.key,
    required this.haveAccount,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          actionText,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              haveAccount,
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ))
      ],
    );
  }
}

class AuthHeaderLabel extends StatelessWidget {
  final String label;

  const AuthHeaderLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 34),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/welcome_screen');
            },
            icon: Icon(Icons.home),
            color: Colors.black,
            style: ButtonStyle(iconSize: MaterialStatePropertyAll<double>(35)),
          )
        ],
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail(){
    return RegExp(r'^[a-zA-Z0-9]+[\-\_\.]*[a-zA-Z0-9]*[@][a-zA-z0-9]{2,}[\.][a-zA-Z]{2,}$').hasMatch(this);
  }
}
