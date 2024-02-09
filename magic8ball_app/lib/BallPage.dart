import 'package:flutter/material.dart';
import 'package:magic8ball_app/Ball.dart';
class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Magic 8 Ball",style: TextStyle(fontFamily: 'BioRhyme'),),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)
            )
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      body: Ball(),
    );
  }
}
