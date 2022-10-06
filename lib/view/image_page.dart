import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_image_search_app/common/http_client/http_client.dart';
import 'package:flutter_image_search_app/common/routers/routers.dart';

class ImagePage extends StatelessWidget {
  const ImagePage(
      {super.key, required this.getImageUrl, required this.getImageTitle});
  final String getImageUrl;
  final String getImageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImagePage"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100.0),
              height: 400,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: getImageUrl,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
                cacheManager: CacheManager(Config("image_cache",
                    stalePeriod: const Duration(days: 1))),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 1.0),
              child: Container(
                margin: const EdgeInsets.only(
                    bottom: 100.0, right: 20.0, left: 20.0),
                child: Text(getImageTitle),
              ),
            )
          ],
        ),
      ),
    );
  }
}
