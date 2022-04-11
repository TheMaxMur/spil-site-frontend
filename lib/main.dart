import 'package:flutter/material.dart';
import 'package:web_app/locator.dart';
import 'package:web_app/routing/route_names.dart';
import 'package:web_app/routing/router.dart';
import 'package:web_app/services/navigation_service.dart';
import 'package:web_app/views/contact_view/contact_view.dart';
import 'package:web_app/views/home/home_view.dart';
import 'package:web_app/views/layout_template/layout_template.dart';
import 'package:web_app/views/projects/project_details_view.dart';
import 'package:web_app/views/projects/projects_view.dart';
import 'package:web_app/widgets/projects_details/project_details_widget.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setupLocator();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'СПИЛ',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
        primarySwatch: Colors.blue,
      ),
      // routes: {
      //   '/home': (context) => HomeView(),
      //   '/projects': (context) => ProjectsView(),
      //   '/contact': (context) => ContactView(),
      //   '/projects/project_details': (context) {

      //     final arguments = ModalRoute.of(context)?.settings.arguments;
      //     if (arguments is int) {
      //       return ProjectDetailsView(projectId: arguments);
      //     }
      //     else {
      //       return ProjectDetailsView(projectId: 1);
      //     }
      //   },
      // },
      // initialRoute: '/home',
      builder: (context, child) => LayoutTemplate(child: child!, contextMain: context,),

      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
    );
  }
}
