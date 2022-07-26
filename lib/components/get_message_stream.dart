import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/message_bubble.dart';

class GetMessageStream extends StatelessWidget {
  const GetMessageStream({
    Key? key,
    required FirebaseFirestore fireStore,
    required this.loggedInUser,
  })  : _fireStore = fireStore,
        super(key: key);

  final FirebaseFirestore _fireStore;
  final User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map>>(
      stream: _fireStore.collection("messages").snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;

        for (var message in messages) {
          final messageData = message.data();
          final messageText = messageData["text"];
          final senderUser = messageData["senderUser"];
          final currentUser = loggedInUser.email;
          final messageBubble = MessageBubble(
            messageText: messageText,
            senderUser: senderUser,
            isMe: senderUser == currentUser,
          );
          messageWidgets.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
