import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:web_app/views/projects/projects_view.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 150,
            width: 300,
            child: SvgPicture.asset('assets/logo.svg', color: Colors.black,),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  child: Text(
                    'СПИЛ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
              SizedBox(
                width: 60,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/projects', (route) => false);
                  },
                  child: Text(
                    'Проекты',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
              SizedBox(
                width: 60,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/contact', (route) => false);
                  },
                  child: Text(
                    'Контакты',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
