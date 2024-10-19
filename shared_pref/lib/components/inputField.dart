
import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  const Inputfield(
      {super.key,
      this.textInputType = TextInputType.text,
      this.hintText = '',
      this.label = '',
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.blue.shade50,
            filled: true,
            hintStyle: const TextStyle(color: Colors.black45),
            label: Text(label),
            labelStyle: const TextStyle(fontSize: 14),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.grey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.teal, width: 2))),
      ),
    );
  }
}
