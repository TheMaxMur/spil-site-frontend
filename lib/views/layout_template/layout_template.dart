import 'package:flutter/material.dart';
// import 'package:web_app/routing/router.dart';
// import 'package:web_app/services/navigation_service.dart';
import 'package:web_app/widgets/navigation_bar/adaptive_navigation_bar.dart';
import 'package:web_app/widgets/navigation_bar/drawer_item.dart';
// import 'package:web_app/widgets/navigation_bar/navigation_drawer_header.dart';

// import '../../locator.dart';
// import '../../routing/route_names.dart';
import '../../widgets/centered_view/centered_view.dart';
// import '../../widgets/home_details/home_details.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth > 900) {
      if (currentHeight > 400) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            child: CenteredView(
              child: Column(
                children: [
                  MainNavigationBar(),
                  SizedBox(
                    child: Container(color: Colors.transparent),
                    height: 40,
                  ),
                  Expanded(
                    child: child,
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            child: CenteredView(
              child: Column(
                children: [
                  MainNavigationBar(),
                  // SizedBox(
                  //   child: Container(color: Colors.transparent),
                  //   height: 5,
                  // ),
                  Expanded(
                    child: child,
                  )
                ],
              ),
            ),
          ),
        );
      }
    } else {
      if (currentHeight > 400) {
        return Scaffold(
          endDrawer: Container(
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
            child: Column(
              children: <Widget>[
                DrawerItem(title: 'Home', icon: Icons.home, route: '/home'),
                DrawerItem(title: 'News', icon: Icons.view_quilt, route: '/news'),
                DrawerItem(title: 'Projects', icon: Icons.folder, route: '/projects'),
                DrawerItem(title: 'Contacts', icon: Icons.call, route: '/contacts'),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            child: CenteredView(
              child: Column(
                children: [
                  MainNavigationBar(),
                  SizedBox(
                    child: Container(color: Colors.transparent),
                    height: 20,
                  ),
                  Expanded(
                    child: child,
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          endDrawer: Container(
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
            child: Column(
              children: <Widget>[
                DrawerItem(title: 'Home', icon: Icons.home, route: '/home'),
                DrawerItem(title: 'News', icon: Icons.view_quilt, route: '/news'),
                DrawerItem(title: 'Projects', icon: Icons.folder, route: '/projects'),
                DrawerItem(title: 'Contacts', icon: Icons.call, route: '/contacts'),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.white,
            child: CenteredView(
              child: Column(
                children: [
                  MainNavigationBar(),
                  // SizedBox(
                  //   child: Container(color: Colors.transparent),
                  //   height: 10,
                  // ),
                  Expanded(
                    child: child,
                  )
                ],
              ),
            ),
          ),
        );
      }
    }
  }
}
