import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:ngdemo10/models/user_model.dart';
import 'package:ngdemo10/services/pref_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "no name";
  List<User> userList = [
    User(id: 1002, username: "Foziljon"),
    User(id: 1003, username: "Dilshod"),
  ];

  @override
  void initState() {
    super.initState();
    // Prefs.storeName("Jhon Wick");
    // _loadName();

    // User user = User(id: 1001, username: "Jhon Wick");
    // Prefs.storeUser(user);
    // _loadUser();

    // Prefs.storeUserList(userList);
    // _loadUserList();
  }

  // _loadUserList() async {
  //   List<User>? result = await Prefs.loadUserList();
  //   setState(() {
  //     name = result!.length.toString();
  //   });
  // }

  // _loadUser() async {
  //   User? user = await Prefs.loadUser();
  //   setState(() {
  //     this.name = user!.toMap().toString();
  //   });
  // }
  //
  // _loadName() async {
  //   String name = await Prefs.loadName();
  //   setState(() {
  //     this.name = name;
  //   });
  //
  //   print(name);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Shared Preference"),
      ),
      body: SharedBuilder(
        listenKeys: const {"key1", "key2"},
        builder: (EncryptedSharedPreferences encryptedSharedPreferences) {
          return Text("value :${encryptedSharedPreferences.getString("key1")}");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          EncryptedSharedPreferences.getInstance()
              .setString("key1", 'dataValue');
          Future.delayed(const Duration(seconds: 3), () {
            EncryptedSharedPreferences.getInstance()
                .setString('key2', 'dataValue');
          });
        },
      ),
    );
  }
}
