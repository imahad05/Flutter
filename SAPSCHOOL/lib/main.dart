// import 'package:demo_project/pages/dashboard/teachers_dashboard.dart';
import 'package:demo_project/pages/wellcome/wellcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SAPSCHOOL",
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: const WellcomePage()
    );
  }
}
