import 'package:flutter/material.dart';

class GoogleFacebookGuestLogin extends StatelessWidget {
  final String label;
  final String imageLocation;
  final Function() onPressed;

  const GoogleFacebookGuestLogin({
    super.key,
    required this.label,
    required this.imageLocation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Image(
                  image: AssetImage(imageLocation),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    );
  }
}