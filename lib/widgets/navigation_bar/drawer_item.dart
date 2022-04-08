import 'package:flutter/material.dart';

import '../../locator.dart';
// import '../../routing/route_names.dart';
import '../../services/navigation_service.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const DrawerItem(
      {Key? key, required this.title, required this.icon, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Container(
        child: OutlinedButton(
          onPressed: () {
          
            locator<NavigationService>().navigateTo(route);
            
          },
          child: Row(
            children: <Widget>[
              Icon(icon, color: Colors.black,),
              SizedBox(width: 30),
              Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
