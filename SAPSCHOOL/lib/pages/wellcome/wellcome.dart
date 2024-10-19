import 'package:demo_project/pages/authPages/students.dart';
import 'package:demo_project/pages/authPages/teachers.dart';
import 'package:flutter/material.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Buttons(
              "Teacher Login",
              targetPage: TeachersLogin(),
            ),
            Buttons(
              "Student Login",
              targetPage: StudentLogin(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  final String text; // Mark it as final
  final Widget targetPage;

  // Constructor to accept text
  const Buttons(this.text, {required this.targetPage, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => targetPage));
      },
      child: Container(
        width: 300,
        height: 50, // Adjusted height
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.teal,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
