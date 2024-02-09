import 'package:flutter/material.dart';

class ProfileTileDivider extends StatelessWidget {
  const ProfileTileDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.teal,
        thickness: 1.5,
      ),
    );
  }
}

class ProfileRepeatedSubTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData icon;
  final Function()? onPressed;

  const ProfileRepeatedSubTile({
    super.key,
    required this.title,
    this.subTitle = "",
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle!),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;

  const ProfileHeaderLabel({
    super.key,
    required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            "   $headerLabel   ",
            style: TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
