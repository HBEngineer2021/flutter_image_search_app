import 'package:flutter_image_search_app/repository/bing_image_search/bing_image_search_repository.dart';

class BingImagesSearchViewModel {
  final BingImagesSearchRepository bingImagesSearchRepository =
      BingImagesSearchRepository();
  dynamic fetchBingImagesSearch() async {
    return await bingImagesSearchRepository.fetchBingImagesSearch();
  }

  dynamic getBingImagesKeywordSearch(String keyword) async {
    return await bingImagesSearchRepository.getBingImagesKeywordSearch(keyword);
  }
}
