import 'package:flutter/material.dart';
import 'package:web_app/routing/route_names.dart';
import 'package:web_app/services/navigation_service.dart';

import '../../locator.dart';


class NewsListViewModel extends ChangeNotifier{
  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToNews(int id, int index) {
    _navigationService.navigateTo(SelectNewsRoute, queryParams: {'id' : id.toString(), 'index': index.toString()});
  }
}