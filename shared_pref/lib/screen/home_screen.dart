import 'package:flutter/material.dart';
import 'package:shared_pref/components/Button.dart';
import 'package:shared_pref/screen/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? name;
  String? email;
  String? loginType;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Text(
          "Wellcome $name",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Name"), Text(name ?? "")],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Email"), Text(email ?? "")],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Login Type"), Text(loginType ?? "")],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Button(
                text: "Logout",
                onPress: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();

                  pref.clear();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()));
                })
          ],
        ),
      ),
    );
  }

  void getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    name = pref.getString("name") ?? "";
    email = pref.getString("email") ?? "";
    loginType = pref.getString("loginType") ?? "";
    setState(() {});
  }
}
