import 'package:flutter/material.dart';

class Utils {
  static replaceScreenAfter(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static push(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static popToBack(BuildContext context) {
    Navigator.pop(context);
  }
}
