import 'package:flutter/material.dart';
import 'package:web_app/services/navigation_service.dart';

import '../../locator.dart';
import '../../routing/route_names.dart';

class ProjectListViewModel extends ChangeNotifier{
  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToProject(int id, int index) {
    _navigationService.navigateTo(ProjectRoute, queryParams: {'id' : id.toString(), 'index': index.toString()});
  }
}