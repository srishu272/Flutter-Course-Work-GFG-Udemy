import 'package:flutter/material.dart';
class DashboardTile extends StatelessWidget {
  final Icon icon;
  final String text;
  final Widget nextPage;
  const DashboardTile({super.key, required this.icon, required this.text, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 120,
      height: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => nextPage)
            );
          },
          child: Container(
            padding:const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
            child: Column(
              children: [
                icon,
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
