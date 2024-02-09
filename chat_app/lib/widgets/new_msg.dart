import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMsg extends StatefulWidget {
  const NewMsg({super.key});

  @override
  State<NewMsg> createState() => _NewMsgState();
}

class _NewMsgState extends State<NewMsg> {
  var _msgController = TextEditingController();

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  void _submitMsg() async {
    final enteredMsg = _msgController.text;

    if (enteredMsg
        .trim()
        .isEmpty)
      return;

    FocusScope.of(context).unfocus();
    _msgController.clear();

    final user = FirebaseAuth.instance.currentUser;

    final userData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get();

    FirebaseFirestore.instance.collection('chats').add({
      'text': enteredMsg,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()!['userName'],
      'userImage':userData.data()!['imageUrl'],
    });



  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(child: TextField(
            controller: _msgController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: InputDecoration(
                label: Text("Send a message...")
            ),
          )),
          IconButton(
            onPressed: _submitMsg,
            icon: Icon(Icons.send),
            color: Theme
                .of(context)
                .colorScheme
                .primary,
          )
        ],
      ),
    );
  }
}
