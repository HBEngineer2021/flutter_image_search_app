import 'dart:convert';

class BingImagesSearch {
  final List<String> name;
  final List<String> contentUrl;
  BingImagesSearch({required this.name, required this.contentUrl});
  factory BingImagesSearch.fromJson(Map<String, dynamic> json) {
    List<String> nameToList(dynamic value) {
      List<String> ret = [];
      for (int i = 0; i < value.length; i++) {
        ret.add(value[i]['name']);
      }
      return ret;
    }

    List<String> contentUrlToList(dynamic value) {
      List<String> ret = [];
      for (int i = 0; i < value.length; i++) {
        ret.add(value[i]['contentUrl']);
      }
      return ret;
    }

    return BingImagesSearch(
        name: nameToList(json['value']),
        contentUrl: contentUrlToList(json['value']));
  }

  Map<String, dynamic> toJson() => {'name': name, 'contentUrl': contentUrl};
}

BingImagesSearch bingImagesSearchFromJson(String string) =>
    BingImagesSearch.fromJson(json.decode(string));

String bingImagesSearchToJson(BingImagesSearch bingImagesSearch) =>
    json.encode(bingImagesSearch.toJson());
