import 'package:firebase_auth/firebase_auth.dart';
import 'package:tinder_app_flutter/data/db/remote/response.dart';

class FirebaseAuthSource {
  FirebaseAuth instance = FirebaseAuth.instance;

  Future<Response<UserCredential>> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await instance.signInWithEmailAndPassword(
          email: email, password: password);
      return Response.success(userCredential);
    } catch (e) {
      return Response.error(
          ((e as FirebaseException).message ?? e.toString()));
    }
  }

  Future<Response<UserCredential>> register(String email, String password) async {
    try {
      UserCredential userCredential = await instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Response.success(userCredential);
    } catch (e) {
      return Response.error(
          ((e as FirebaseException).message ?? e.toString()));
    }
  }
}
