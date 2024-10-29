import 'package:flutter/material.dart';
import 'package:flutter_bloc_example_app/utils/app_routes.dart';

class Navigation {
  static Future push(
    BuildContext context,
    AppRoutes appRoutes, {
    dynamic arguments,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => appRoutes.child(
          arguments: arguments,
        ),
      ),
    );
  }

  static Future pushAndRemoveUntil(
    BuildContext context,
    AppRoutes appRoutes, {
        dynamic arguments,
      }) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => appRoutes.child(
          arguments: arguments,
        ),
      ),
      (route) => false,
    );
  }

  static void pop(BuildContext context, [dynamic result]) {
    return Navigator.pop(context, result);
  }
}
