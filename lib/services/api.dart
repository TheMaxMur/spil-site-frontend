import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/news_view/news.dart';
import '../widgets/projects_details/projects.dart';

class Api {
  static const String _apiEndpoint = 'https://spilapi.maxmur.info:4000';

  Future<dynamic> getProjects() async {
    var response = await http.get(Uri.parse('$_apiEndpoint/projects/'), headers: {"Access-Control-Allow-Origin": "*"});

    if (response.statusCode == 200) {
      var projects = (json.decode(utf8.decode(response.bodyBytes)) as List)
          .map((project) => Project.fromJson(project))
          .toList();
      return projects;
    }
    return 'Error get response';
  }

  Future<dynamic> getNews() async {
    var response = await http.get(Uri.parse('$_apiEndpoint/news/'), headers: {"Access-Control-Allow-Origin": "*"});

    if (response.statusCode == 200) {
      var news = (json.decode(utf8.decode(response.bodyBytes)) as List)
          .map((newsOne) => NewsMain.fromJson(newsOne))
          .toList();
      return news;
    }
    return 'Error get response';
  }
}
