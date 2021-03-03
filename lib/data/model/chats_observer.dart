import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tinder_app_flutter/data/db/entity/chat.dart';
import 'package:tinder_app_flutter/data/db/remote/firebase_database_source.dart';
import 'package:tinder_app_flutter/data/model/chat_with_user.dart';

class ChatsObserver {
  final FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();
  List<ChatWithUser> chatsList = [];
  List<StreamSubscription<DocumentSnapshot>> subscriptionList = [];

  ChatsObserver(this.chatsList);

  void startObservers(Function onChatUpdated) {
    chatsList.forEach((element) {
      StreamSubscription<DocumentSnapshot> chatSubscription =
          _databaseSource.observeChat(element.chat.id).listen((event) {
        Chat updatedChat = Chat.fromSnapshot(event);

        if (updatedChat.lastMessage == null ||
            element.chat.lastMessage == null ||
            (updatedChat.lastMessage.epochTimeMs !=
                element.chat.lastMessage.epochTimeMs)) {
          element.chat = updatedChat;
          onChatUpdated();
        }
      });

      subscriptionList.add(chatSubscription);
    });
  }

  void removeObservers() async {
    for (var i = 0; i < subscriptionList.length; i++) {
      await subscriptionList[i].cancel();
      subscriptionList.removeAt(i);
    }

    subscriptionList = null;
    chatsList = null;
  }
}
