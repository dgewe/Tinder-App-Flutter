import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  int epochTimeMs;
  bool seen;
  String senderId;
  String text;

  Message(this.epochTimeMs, this.seen, this.senderId, this.text);

  Message.fromMap(Map<String, dynamic> map) {
    epochTimeMs = map['epoch_time_ms'];
    seen = map['seen'];
    senderId = map['sender_id'];
    text = map['text'];
  }

  Message.fromSnapshot(DocumentSnapshot snapshot) {
    epochTimeMs = snapshot['epoch_time_ms'];
    seen = snapshot['seen'];
    senderId = snapshot['sender_id'];
    text = snapshot['text'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'epoch_time_ms': epochTimeMs,
      'seen': seen,
      'sender_id': senderId,
      'text': text
    };
  }
}
