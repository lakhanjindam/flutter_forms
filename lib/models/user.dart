import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement {
  String uid;
  UserManagement(this.uid);

  void storeNewUser(user, context) async {
    await Firestore.instance
        .collection("users")
        .document(uid)
        .setData({"email": user.email});
    print(user.email);
  }

  void checkExistUser(email) async {
    await Firestore.instance.collection("users").getDocuments();
  }
}
