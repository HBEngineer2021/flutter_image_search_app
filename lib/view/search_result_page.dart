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

class SearchResultPage extends StatelessWidget {
  SearchResultPage({super.key, required this.keyword});
  final String keyword;
  final BingImagesSearchViewModel bingImagesSearchViewModel =
      BingImagesSearchViewModel();
  List<String> menuOfList = ["Save Image", "Share"];
  List<BingImagesSearch> valueOfList = [];
  int count = 0;
  List<String> nameOfList = [];
  List<String> countentUrlOfList = [];

  Future getBingImagesKeywordSearch(String value) async {
    valueOfList.add(
        (await bingImagesSearchViewModel.getBingImagesKeywordSearch(value))!);
    print(valueOfList.first.contentUrl);
    count = valueOfList.first.name.length;
    nameOfList = valueOfList.first.name;
    countentUrlOfList = valueOfList.first.contentUrl;
  }

  Future getBingImagesSearch() async {}

  @override
  Widget build(BuildContext context) {
    final Routers routers = Routers.shared;
    return Scaffold(
      appBar: AppBar(title: Text("検索結果：$keyword")),
      body: FutureBuilder(
        future: getBingImagesKeywordSearch(keyword),
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
                          routers.pushPages(
                            context,
                            ImagePage(
                                getImageUrl: countentUrlOfList[i],
                                getImageTitle: nameOfList[i]),
                          );
                        },
                        onLongPress: () {
                          routers.pushExpandImagePages(
                            context,
                            Center(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(top: 150.0),
                                    height: 400,
                                    width: double.infinity,
                                    child: CachedNetworkImage(
                                        imageUrl: countentUrlOfList[i]),
                                  ),
                                  Align(
                                    alignment: const Alignment(0.0, 1.0),
                                    child: Container(
                                      margin: const EdgeInsets.all(50.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: menuOfList.length,
                                        itemBuilder: ((context, index) {
                                          return Card(
                                            child: ListTile(
                                              title: Text(menuOfList[index]),
                                              onTap: () {
                                                switch (index) {
                                                  case 0:
                                                    return;
                                                  case 1:
                                                    return;
                                                }
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
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
