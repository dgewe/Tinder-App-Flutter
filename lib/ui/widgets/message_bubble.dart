import 'package:flutter/material.dart';
import 'package:tinder_app_flutter/util/constants.dart';
import 'package:tinder_app_flutter/util/utils.dart';

class MessageBubble extends StatelessWidget {
  final int epochTimeMs;
  final String text;
  final bool isSenderMyUser;
  final bool includeTime;

  MessageBubble(
      {@required this.epochTimeMs,
      @required this.text,
      @required this.isSenderMyUser,
      @required this.includeTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isSenderMyUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          this.includeTime
              ? Opacity(
                  opacity: 0.4,
                  child: Container(
                    child: Text(convertEpochMsToDateTime(epochTimeMs),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    width: double.infinity,
                  ),
                )
              : Container(),
          SizedBox(height: 4),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75),
            child: Material(
              borderRadius: BorderRadius.circular(8.0),
              elevation: 5.0,
              color: isSenderMyUser ? kAccentColor : kSecondaryColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: isSenderMyUser ? kSecondaryColor : Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
