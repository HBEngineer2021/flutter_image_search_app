import 'package:flutter/material.dart';

class Routers {
  static Routers shared = Routers();

  void pushPages(BuildContext context, StatelessWidget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void popPages(BuildContext context) {
    Navigator.pop(context);
  }
}
