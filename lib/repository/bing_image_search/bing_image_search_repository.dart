import 'package:flutter_image_search_app/common/http_client/http_client.dart';

class BingImagesSearchRepository {
  final HttpClient httpClient = HttpClient.shared;
  dynamic fetchBingImagesSearch() async {
    return await httpClient.fetchBingImageSearch();
  }

  dynamic getBingImagesKeywordSearch(String keyword) async {
    return await httpClient.getBingImageKeywordSearch(keyword);
  }
}
