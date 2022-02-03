import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_messenger_clone/helpfunctions/sharedprefs_helper.dart';
import 'package:flutter_messenger_clone/services/database.dart';
import 'package:flutter_messenger_clone/views/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  // Simple explaination: context defines the current location.
  // We need to navigate to Home page after a successful login, so we need to pass in the current location.
  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn() as GoogleSignInAccount;

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result =
        await _firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (userDetails != null) {
      SharedPreferenceHelper().saveUserId(userDetails.uid as String);
      SharedPreferenceHelper()
          .saveDisplayName(userDetails.displayName as String);
      SharedPreferenceHelper().saveUserEmail(userDetails.email as String);
      SharedPreferenceHelper()
          .saveUserProfileURL(userDetails.photoURL as String);

      Map<String, dynamic> userInfoMap = {
        "email": userDetails.email,
        "userName": userDetails.email?.replaceAll("@gmail.com", ""),
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL
      };

      DatabaseMethods()
          .addUserInfoToDB(userDetails.uid, userInfoMap)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      });
    }
  }

  Future signOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    await auth.signOut();
  }
}
