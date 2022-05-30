import 'package:flutter/cupertino.dart';
import 'package:web_app/locator.dart';

import '../../services/api.dart';

class NewsMain {
  late int id;
  late String assetsImage;
  late String newsName;
  late String newsText;
  late List newsImages;
  late String newsTimestamp;

  NewsMain({
    required this.id,
    required this.assetsImage,
    required this.newsName,
    required this.newsText,
    required this.newsImages,
    required this.newsTimestamp,
  });

  NewsMain.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        assetsImage = map['preview_image'],
        newsName = map['title'],
        newsText = map['text'],
        newsImages = map['news_image'],
        newsTimestamp = map['create_timestamp'];
}

class News extends ChangeNotifier {
  static final _api = locator<Api>();

  static late List _news = [];
  static List get news => _news;
  static Future getNews() async {
    var newsResult = await _api.getNews();

    if (newsResult is String) {
      //error
    } else {
      _news = newsResult;
      return _news;
    }
  }
}
