import 'package:flutter/material.dart';
import 'package:shared_pref/components/Button.dart';
import 'package:shared_pref/components/inputField.dart';
import 'package:shared_pref/constant/constant.dart';
import 'package:shared_pref/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: heading,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Inputfield(
              textInputType: TextInputType.text,
              label: "Name",
              hintText: "Abdul Ahad",
              controller: nameController,
            ),
            Inputfield(
              textInputType: TextInputType.emailAddress,
              label: "Email",
              hintText: "ahad@saps.com",
              controller: emialController,
            ),
            Inputfield(
              textInputType: TextInputType.visiblePassword,
              label: "Password",
              hintText: "***********",
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              error,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Button(text: "Sign Up", onPress: signUp)
          ],
        ),
      ),
    );
  }

  void signUp() async {
    if (nameController.text.isEmpty) {
      error = "Name is Required";
      setState(() {});
      return;
    }
    if (emialController.text.isEmpty) {
      error = "Email is Required";
      setState(() {});
      return;
    }
    if (passwordController.text.isEmpty) {
      error = "Password is Required";
      setState(() {});
      return;
    }
    error = "";
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", nameController.text.toString());
    pref.setString("email", emialController.text.toString());
    pref.setString("password", passwordController.text.toString());
    pref.setString("loginType", "Teacher");
    pref.setBool("isLogin", true);

    // ignore: use_build_context_synchronously
    Navigator.push(
        // ignore: use_build_context_synchronously
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));

    setState(() {});
  }
}
