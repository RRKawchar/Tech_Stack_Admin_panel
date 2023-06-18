import 'package:flutter/material.dart';

class Routes {
  static Future<dynamic> pushAndRemoveUntil({
   required BuildContext context,
     required Widget page,
  }) {
    return Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_) => page), (route) => false);
  }

  static Future<dynamic> push({
    required BuildContext context,
    required Widget page,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
