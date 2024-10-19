import 'package:calculator/components/my_button.dart';
import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(userInput.toString(), style: inputsTextStyle),
                            Text(
                              answer.toString(),
                              style: inputsTextStyle,
                            ),
                          ],
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      btnText: "AC",
                      onPress: () {
                        userInput = "";
                        answer = "";
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "+/-",
                      onPress: () {
                        // userInput += '';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "%",
                      onPress: () {
                        userInput += '%';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "/",
                      onPress: () {
                        userInput += '/';
                        setState(() {});
                      },
                      btnColor: btnOrange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      btnText: "7",
                      onPress: () {
                        userInput += '7';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "8",
                      onPress: () {
                        userInput += '8';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "9",
                      onPress: () {
                        userInput += '9';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "x",
                      onPress: () {
                        userInput += 'x';
                        setState(() {});
                      },
                      btnColor: btnOrange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      btnText: "4",
                      onPress: () {
                        userInput += '4';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "5",
                      onPress: () {
                        userInput += '5';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "6",
                      onPress: () {
                        userInput += '6';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "-",
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                      btnColor: btnOrange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      btnText: "1",
                      onPress: () {
                        userInput += '1';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "2",
                      onPress: () {
                        userInput += '2';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "3",
                      onPress: () {
                        userInput += '3';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "+",
                      onPress: () {
                        userInput += '+';
                        setState(() {});
                      },
                      btnColor: btnOrange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      btnText: "0",
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: ".",
                      onPress: () {
                        userInput += '.';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "DEL",
                      onPress: () {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                        setState(() {});
                      },
                    ),
                    MyButton(
                      btnText: "=",
                      onPress: () {
                        equalPress();
                        setState(() {});
                      },
                      btnColor: btnOrange,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput.replaceAll('x', "*");
    Parser p = Parser();
    Expression exppression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = exppression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
    userInput = eval.toString();
  }
}
