import 'package:flutter/material.dart';

import '../../locator.dart';
// import '../../routing/route_names.dart';
import '../../services/navigation_service.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final contextMain;
  final scaffoldKey;

  const DrawerItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.route,
      required this.contextMain,
      required this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    toggleDrawer(route) async {
      locator<NavigationService>().navigateTo(route);
      if (scaffoldKey.currentState!.isEndDrawerOpen) {
        // Duration(seconds: 3);
        scaffoldKey.currentState!.openDrawer();
      } else {
        
        scaffoldKey.currentState!.openEndDrawer(duration: 100);
      }
      locator<NavigationService>().navigateTo(route);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: OutlinedButton(
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
          locator<NavigationService>().navigateTo(route);

//               if(scaffoldKey.currentState.isEndDrawerOpen){ //check if drawer is open
//       Scaffold.of(contextMain).openEndDrawer(); //context of drawer is different
// }
        },
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(width: 30),
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
