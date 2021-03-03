import 'package:cloud_firestore/cloud_firestore.dart';

class Swipe {
  String id;
  bool liked;

  Swipe(this.id, this.liked);

  Swipe.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    liked = snapshot['liked'];
  }
  Swipe.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    liked = map['liked'];
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'liked': liked};
  }
}
