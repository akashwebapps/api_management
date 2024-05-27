// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  bool isButtonSelected = false;
  String tabName;
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;

  void Function() onTap;

  TabButton(
      {super.key,
      required this.isButtonSelected,
      required this.tabName,
      required this.onTap,
      this.topLeft = 0,
      this.topRight = 0,
      this.bottomLeft = 0,
      this.bottomRight = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        height: 70,
        decoration: BoxDecoration(
            color: isButtonSelected ? Colors.green : Color(0xFF141415),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
            )),
        child: Center(
          child: Text(
            tabName,
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
