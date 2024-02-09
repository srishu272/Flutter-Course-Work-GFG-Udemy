import 'package:chat_app/widgets/msgBubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMsg extends StatelessWidget {
  const ChatMsg({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );

          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return Center(
              child: Text("No messages found"),
            );
          }

          if (chatSnapshots.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          }
          final loadedMsgs = chatSnapshots.data!.docs;

          return ListView.builder(
              padding: EdgeInsets.only(bottom: 40, left: 13, right: 13),
              reverse: true,
              itemCount: loadedMsgs.length,
              itemBuilder: (ctx, index) {
                final chatMsg = loadedMsgs[index].data()['text'];
                final nextChatMsg = index + 1 < loadedMsgs.length
                    ? loadedMsgs[index + 1].data()
                    : null;

                final currentMsgUserId = loadedMsgs[index].data()['userId'];
                final nextMsgUserId =
                nextChatMsg != null ? loadedMsgs[index + 1].data()['userId'] : null;
                final nextUserIsSame = nextMsgUserId == currentMsgUserId;
                if (nextUserIsSame) {
                  return MessageBubble.next(
                      message: loadedMsgs[index].data()['text'],
                      isMe: authenticatedUser?.uid == currentMsgUserId);
                } else {
                  return MessageBubble.first(
                      userImage: loadedMsgs[index].data()['userImage'],
                      username: loadedMsgs[index].data()['username'],
                      message: loadedMsgs[index].data()['text'],
                      isMe: authenticatedUser?.uid == currentMsgUserId
                  );
                }
                return Text(loadedMsgs[index].data()['text']);
              });
        });
  }
}
