import 'package:flutter/material.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  // Controllers for the text fields
  final TextEditingController _bformController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers to free up resources
    _bformController.dispose();
    _rollNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 30),
            const LogoWidget(),
            const SizedBox(height: 10),
            const Text(
              "SAPSCHOOL",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2.0),
            ),
            const SizedBox(height: 20),
            // B-Form Number Input Field
            InputField(
              controller: _bformController,
              label: "B-Form Number",
              hint: "42401-1234567-8",
            ),
            // Roll Number Input Field
            InputField(
              controller: _rollNumberController,
              label: "Roll Number",
              hint: "723636",
            ),
            const SizedBox(height: 20),
            // Login Button
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}

// Header Widget
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Students Login",
        style: TextStyle(
          color: Colors.teal,
          fontSize: 30,
          fontWeight: FontWeight.w600,
          fontFamily: "Pacifico",
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Logo Widget
class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 100,
      child: Image(image: AssetImage("assets/logo.png")),
    );
  }
}

// InputField Widget (Reusable for different fields)
class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  const InputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.blue.shade50,
          filled: true,
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.teal, width: 1.5),
          ),
        ),
      ),
    );
  }
}

// LoginButton Widget
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
