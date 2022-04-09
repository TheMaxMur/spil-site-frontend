import 'package:flutter/material.dart';
import 'package:web_app/routing/route_names.dart';
import 'package:web_app/views/projects/project_details_view.dart';
import 'package:web_app/widgets/news_view/news_list_view.dart';
import 'package:web_app/widgets/projects_details/project_details_widget.dart';
// import 'package:web_app/widgets/news_view/news_details_widget.dart';

import '../views/contact_view/contact_view.dart';
import '../views/home/home_view.dart';
import '../views/news/news_details.dart';
import '../views/projects/projects_view.dart';
import '../widgets/projects_details/string_extensions.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings);
    case ProjectsRoute:
      return _getPageRoute(ProjectsView(), settings);
    case ContactsRoute:
      return _getPageRoute(ContactView(), settings);
    case NewsRoute:
      return _getPageRoute(NewsListView(), settings);
    case SelectNewsRoute:
      var id = int.tryParse(routingData['id']);
      var index = int.tryParse(routingData['index']);
      return _getPageRoute(
          NewsDetailsView(newsId: id!, index: index!), settings);
    case ProjectRoute:
      var id = int.tryParse(routingData['id']);
      var index = int.tryParse(routingData['index']);
      return _getPageRoute(
          ProjectDetailsView(projectId: id!, index: index!), settings);
    default:
      return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name!);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  @override
  Duration get transitionDuration => Duration(milliseconds: 5);
}
