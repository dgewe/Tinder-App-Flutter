import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/data/model/chat_with_user.dart';
import 'package:tinder_app_flutter/util/constants.dart';
import 'package:tinder_app_flutter/util/utils.dart';

class ChatListTile extends StatelessWidget {
  final ChatWithUser chatWithUser;
  final Function onTap;
  final Function onLongPress;
  final String myUserId;

  ChatListTile(
      {@required this.chatWithUser,
      @required this.onTap,
      @required this.onLongPress,
      @required this.myUserId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: () {},
      child: Container(
        height: 60,
        child: Row(
          children: [
            Container(
              width: 60,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage(chatWithUser.user.profilePhotoPath),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kAccentColor, width: 1.0),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [getTopRow(), getBottomRow()],
              ),
            )),
          ],
        ),
      ),
    );
  }

  bool isLastMessageMyText() {
    return chatWithUser.chat.lastMessage.senderId == myUserId;
  }

  bool isLastMessageSeen() {
    if (chatWithUser.chat.lastMessage.seen == false &&
        isLastMessageMyText() == false) {
      return false;
    }
    return true;
  }

  Widget getTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            chatWithUser.user.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
            child: Text(
                chatWithUser.chat.lastMessage == null
                    ? ''
                    : convertEpochMsToDateTime(
                        chatWithUser.chat.lastMessage.epochTimeMs),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12))),
      ],
    );
  }

  Widget getBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Opacity(
            opacity: 0.6,
            child: Text(
              chatWithUser.chat.lastMessage == null
                  ? "Write something!"
                  : ((isLastMessageMyText() ? "You: " : "") +
                      chatWithUser.chat.lastMessage.text),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        SizedBox(
            width: 40,
            child: chatWithUser.chat.lastMessage == null ||
                    isLastMessageSeen() == false
                ? Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: kAccentColor, shape: BoxShape.circle),
                  )
                : null)
      ],
    );
  }
}
