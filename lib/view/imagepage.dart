import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/common/http_client/http_client.dart';
import 'package:flutter_image_search_app/common/routers/routers.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});
  @override
  Widget build(BuildContext context) {
    final Routers routers = Routers.shared;
    final HttpClient httpClient = HttpClient.shared;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImagePage"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("戻れ"),
          onPressed: () {
            //httpClient.getData();
          },
        ),
      ),
    );
  }
}
