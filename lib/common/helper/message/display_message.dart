import 'package:flutter/material.dart';

class DisplayMessage {
  static void errorMessage(BuildContext context, String message) {
    var snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
