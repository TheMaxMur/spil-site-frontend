import 'package:flutter/cupertino.dart';
import 'package:web_app/locator.dart';

import '../../services/api.dart';

class Project {
  late int id;
  late String assetsImage;
  late String projectName;
  late String projectText;
  late String projectTheme;
  late String projectCreators;
  late List projectImages;
  late String projectTimestamp;

  Project(
      {required this.id, required this.assetsImage, required this.projectName,
       required this.projectText, required this.projectTheme, required this.projectCreators,
       required this.projectImages,
       required this.projectTimestamp,
       });

  Project.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        assetsImage = map['preview_image'],
        projectName = map['title'],
        projectText = map['text'],
        projectTheme = map['theme'],
        projectCreators = map['creators'],
        projectImages = map['projects_image'],
        projectTimestamp = map['created'];
}

class Projects extends ChangeNotifier{
  static final _api = locator<Api>();

  static late List _projects = [];
  static List get  projects => _projects;
  static Future getProjects() async {
    var projectResult = await _api.getProjects();

    if (projectResult is String) {
      //error
    } else {
      _projects = projectResult;
      return _projects;
    }
  }
}
