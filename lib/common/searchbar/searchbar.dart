import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/common/routers/routers.dart';
import 'package:flutter_image_search_app/view/search_result_page.dart';

import '../../model/bing_image_search/bing_image_search.dart';
import '../../view_model/bing_image_search_view_model/bing_image_search_view_model.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => SearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();
  final BingImagesSearchViewModel bingImagesSearchViewModel =
      BingImagesSearchViewModel();
  List<BingImagesSearch> valueOfList = [];
  final Routers routers = Routers.shared;

  void searchAction(value) {
    setState(() {
      controller.clear();
      print(value);
      routers.pushPages(context, SearchResultPage(keyword: value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Container(
              width: 350,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Search Animation Images...",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                  contentPadding: EdgeInsets.only(left: 5.0),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                ),
                onSubmitted: (value) => searchAction(value),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
