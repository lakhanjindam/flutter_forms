import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement {
  String uid;
  UserManagement(this.uid);

  void storeNewUser(user, context) {
    Firestore.instance
        .collection("users")
        .document(uid)
        .setData({"email": user.email});
  }

  void checkExistUser(email) {
    Firestore.instance.collection("users").getDocuments();
  }
}
