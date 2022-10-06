import 'package:cached_network_image/cached_network_image.dart';
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

  Future<void> pushExpandImagePages(BuildContext context, Widget wiget) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        fullscreenDialog: true,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (context, _, __) {
          return wiget;
        },
      ),
    );
  }

  void popPages(BuildContext context) {
    Navigator.pop(context);
  }
}
