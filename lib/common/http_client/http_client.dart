import 'dart:convert';
import 'package:flutter_image_search_app/model/bing_image_search/bing_image_search.dart';
import 'package:http/http.dart' as http;
import '../../model/bing_image_search/bing_image_search_params.dart';

class HttpClient {
  static HttpClient shared = HttpClient();
  Future<BingImagesSearch> fetchBingImageSearch() async {
    String baseUrl = BingImageSearchAPI.baseUrl.path;
    String imagesSearch = BingImageSearchAPI.imagesSearch.path;
    Map<String, dynamic>? query = BingImageSearchAPIQueryParam.query.params;
    Map<String, String>? headers = BingImageSearchAPIHeaders.headers.params;
    var response = await http.get(Uri.https(baseUrl, imagesSearch, query),
        headers: headers);
    var jsonResponse = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return BingImagesSearch.fromJson(jsonResponse);
      default:
        throw Exception('Failure Bing Images Search API...');
    }
  }

  Future<BingImagesSearch> getBingImageKeywordSearch(String keyword) async {
    String baseUrl = BingImageSearchAPI.baseUrl.path;
    String imagesSearch = BingImageSearchAPI.imagesSearch.path;
    Map<String, dynamic>? query = {
      'q': 'アニメ $keyword',
      'count': '1000',
      'mkt': 'ja-JP',
      'offset': '20'
    };
    Map<String, String>? headers = BingImageSearchAPIHeaders.headers.params;
    var response = await http.get(Uri.https(baseUrl, imagesSearch, query),
        headers: headers);
    var jsonResponse = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return BingImagesSearch.fromJson(jsonResponse);
      default:
        throw Exception('Failure Bing Images Search API...');
    }
  }
}
