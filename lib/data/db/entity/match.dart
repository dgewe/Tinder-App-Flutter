import 'package:cloud_firestore/cloud_firestore.dart';

class Match {
  String id;

  Match(this.id);

  Match.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id};
  }
}
