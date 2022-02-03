import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  // Add current user to DB
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }
}
