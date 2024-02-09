import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class WakeLock extends StatefulWidget {
  const WakeLock({super.key});

  @override
  State<WakeLock> createState() => _WakeLockState();
}

class _WakeLockState extends State<WakeLock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("WakeLock in Flutter",style: TextStyle(fontFamily: 'BioRhyme'),),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(
              flex: 3,
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  Wakelock.enable();
                });
              },
              child: const Text('enable wakelock'),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  Wakelock.disable();
                });
              },
              child: const Text('disable wakelock'),
            ),
            const Spacer(
              flex: 2,
            ),
            FutureBuilder(
              future: Wakelock.enabled,
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }

                return Text('The Wakelock');
              },
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
