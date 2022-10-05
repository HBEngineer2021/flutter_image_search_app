import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_image_search_app/common/http_client/http_client.dart';
import 'package:flutter_image_search_app/common/searchbar/searchbar.dart';
import 'package:flutter_image_search_app/model/bing_image_search/bing_image_search.dart';
import 'package:flutter_image_search_app/view/image_page.dart';
import 'package:flutter_image_search_app/common/routers/routers.dart';
import 'package:flutter_image_search_app/view_model/bing_image_search_view_model/bing_image_search_view_model.dart';

class TopPage extends StatelessWidget {
  TopPage({super.key});

  final BingImagesSearchViewModel bingImagesSearchViewModel =
      BingImagesSearchViewModel();

  List<BingImagesSearch> valueOfList = [];
  int count = 0;
  List<String> nameOfList = [];
  List<String> countentUrlOfList = [];
  Future getBingImagesSearch() async {
    valueOfList.add((await bingImagesSearchViewModel.fetchBingImagesSearch())!);
    count = valueOfList.first.name.length;
    nameOfList = valueOfList.first.name;
    countentUrlOfList = valueOfList.first.contentUrl;
  }

  @override
  Widget build(BuildContext context) {
    final Routers routers = Routers.shared;
    return Scaffold(
      appBar: const SearchBar(),
      body: FutureBuilder(
        future: getBingImagesSearch(),
        builder: (context, snapshot) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 150.0,
            ),
            itemCount: count,
            itemBuilder: ((context, index) {
              int i = int.parse('$index');
              return SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: countentUrlOfList[i],
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                      cacheManager: CacheManager(Config("image_cache",
                          stalePeriod: const Duration(days: 1))),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          routers.pushPages(context,
                              ImagePage(getImageUrl: countentUrlOfList[i]));
                        },
                        onLongPress: () {
                          print("OK");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, elevation: 0),
                        child: null)
                  ],
                ),
              );
            }),
            shrinkWrap: false,
          );
        },
      ),
    );
  }
}
