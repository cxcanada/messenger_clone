// Save user credential information here which is accessible across application
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // Shared preferences require KEY VALUE pairs.
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String displayNameKey = "USERDISPLAYNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userProfilePictureKey = "USERPROFILEPICTUREKEY";

  // Setter
  // save user data to static fields
  Future<bool> saveUserId(String userIdValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, userIdValue);
  }

  Future<bool> saveUserName(String userNameValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, userNameValue);
  }

  Future<bool> saveDisplayName(String displayNameValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(displayNameKey, displayNameValue);
  }

  Future<bool> saveUserEmail(String userEmailValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, userEmailValue);
  }

  Future<bool> saveUserProfileURL(String userProfilePictureValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userProfilePictureKey, userProfilePictureValue);
  }

  // Getter
  // get user data
  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey) as String;
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey) as String;
  }

  Future<String> getDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(displayNameKey) as String;
  }

  Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey) as String;
  }

  Future<String> getUserProfileURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userProfilePictureKey) as String;
  }
}
