enum BingImageSearchAPI { baseUrl, imagesSearch }

enum BingImageSearchAPIQueryParam { query }

enum BingImageSearchAPIHeaders { headers }

extension BingImageSearchAPIExtension on BingImageSearchAPI {
  String get path {
    switch (this) {
      case BingImageSearchAPI.baseUrl:
        return "api.bing.microsoft.com";
      case BingImageSearchAPI.imagesSearch:
        return "/v7.0/images/search";
    }
  }
}

extension BingImageSearchAPIQueryParamExtension
    on BingImageSearchAPIQueryParam {
  Map<String, dynamic>? get params {
    switch (this) {
      case BingImageSearchAPIQueryParam.query:
        return {'q': 'アニメ', 'count': '1000', 'mkt': 'ja-JP', 'offset': '20'};
    }
  }
}

extension BingImageSearchAPIHeadersExtension on BingImageSearchAPIHeaders {
  Map<String, String>? get params {
    switch (this) {
      case BingImageSearchAPIHeaders.headers:
        return {
          'Content-Type': 'application/json',
          'Ocp-Apim-Subscription-Key': '41ec978c47784ea49c5be8b86c59c514'
        };
    }
  }
}
