import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_image_search_app/common/http_client/http_client.dart';
import 'package:flutter_image_search_app/common/routers/routers.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key, required this.getImageUrl});
  final String getImageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImagePage"),
      ),
      body: Center(
        child: SizedBox(
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
            cacheManager: CacheManager(
                Config("image_cache", stalePeriod: const Duration(days: 1))),
          ),
        ),
      ),
    );
  }
}
