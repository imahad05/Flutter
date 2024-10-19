// ignore: must_be_immutable
import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final VoidCallback onPress;
  const MyButton(
      {super.key,
      this.btnColor = btnGrey,
      required this.btnText,
      required this.onPress});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 70,
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: btnColor, borderRadius: BorderRadius.circular(50.0)),
        child: Text(
          btnText,
          style: const TextStyle(
              color: whiteColor, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
