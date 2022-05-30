import 'package:flutter/material.dart';
// import 'package:web_app/routing/router.dart';
// import 'package:web_app/services/navigation_service.dart';
import 'package:web_app/widgets/navigation_bar/adaptive_navigation_bar.dart';
import 'package:web_app/widgets/navigation_bar/drawer_item.dart';
// import 'package:web_app/widgets/navigation_bar/navigation_drawer_header.dart';

// import '../../locator.dart';
// import '../../routing/route_names.dart';
import '../../locator.dart';
import '../../services/navigation_service.dart';
import '../../widgets/centered_view/centered_view.dart';
// import '../../widgets/home_details/home_details.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  final contextMain;
  const LayoutTemplate({Key? key, required this.child, required this.contextMain}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
      GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
      
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth > 900) {
      if (currentHeight > 400) {
        return 
        Scaffold(
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
          key: _scaffoldKey,
          endDrawer: Container(
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
            child: Column(
              children: <Widget>[
                
                DrawerItem(title: 'СПИЛ', icon: Icons.home, route: '/home', contextMain: context,scaffoldKey: _scaffoldKey),
                DrawerItem(title: 'Новости', icon: Icons.view_quilt, route: '/news', contextMain: context,scaffoldKey: _scaffoldKey),
                DrawerItem(title: 'Проекты', icon: Icons.folder, route: '/projects', contextMain: context,scaffoldKey: _scaffoldKey),
                DrawerItem(title: 'Контакты', icon: Icons.call, route: '/contacts', contextMain: context,scaffoldKey: _scaffoldKey),
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
          key: _scaffoldKey,
          endDrawer: Container(
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
            child: Column(
              children: <Widget>[
                DrawerItem(title: 'СПИЛ', icon: Icons.home, route: '/home', contextMain: context,scaffoldKey: _scaffoldKey),
                DrawerItem(title: 'Новости', icon: Icons.view_quilt, route: '/news', contextMain: context,scaffoldKey: _scaffoldKey),
                DrawerItem(title: 'Проекты', icon: Icons.folder, route: '/projects', contextMain: context,scaffoldKey: _scaffoldKey),
                DrawerItem(title: 'Контакты', icon: Icons.call, route: '/contacts', contextMain: context,scaffoldKey: _scaffoldKey),
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

