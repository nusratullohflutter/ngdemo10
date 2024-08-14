import 'dart:convert';

import 'package:encrypt_shared_preferences/provider.dart';
import 'package:ngdemo10/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final key = "";
  await EncryptedSharedPreferences.initialize(key: key);
  var sharedPref = EncryptedSharedPreferences.getInstance();

  await sharedPref.setString('user_token', 'xxxxxxxxxxxx',
      notify: true); ////notify = true by default

  sharedPref.getString('user_token'); //xxxxxxxxxxxx

  await sharedPref.setInt('age', 99, notify: true); //notify = true by default

  sharedPref.getInt('age'); //99

  await sharedPref.remove('user_token',
      notify: true); //notify = true by default
}

class Prefs {
  //Encrypt_shared_preferences

  //User List
  static storeUserList(List<User> userList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userListString =
        userList.map((user) => jsonEncode(user.toMap())).toList();
    await prefs.setStringList("user_list", userListString);
  }

  static Future<List<User>?> loadUserList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userListString = prefs.getStringList("user_list");
    if (userListString == null || userListString.isEmpty) return null;

    List<User> userList = userListString
        .map((userString) => User.fromMap(jsonDecode(userString)))
        .toList();
    return userList;
  }

  static Future<bool> removeUserList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user_list");
  }

  // User related

  static storeUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String useString = jsonEncode(user.toMap());
    prefs.setString("user", useString);
  }

  static Future<User?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("user");
    if (userString == null || userString.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(userString);
    return User.fromMap(map);
  }

  static Future<bool> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }

  // name related

  static storeName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
  }

  static Future<String> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("name");
    return name ?? "";
  }

  static Future<bool> removeName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");
  }
}
