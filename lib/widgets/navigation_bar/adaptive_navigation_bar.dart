import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_app/locator.dart';
import 'package:web_app/routing/route_names.dart';
// import 'package:web_app/views/home/home_view.dart';
// import 'package:web_app/widgets/home_details/home_details.dart';

import '../../services/navigation_service.dart';

class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {

  @override
  Widget build(BuildContext context) {
    
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    if (currentHeight > 500) {
      if (currentWidth > 900) {
        return Container(
          color: Colors.white,
          height:300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/ExtraLogo3png.png',
                  // color: Colors.black,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        locator<NavigationService>().navigateTo(HomeRoute);
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
                        locator<NavigationService>().navigateTo(NewsRoute);
                      },
                      child: Text(
                        'Новости',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
                  SizedBox(
                    width: 60,
                  ),
                  TextButton(
                      onPressed: () {
                        locator<NavigationService>().navigateTo(ProjectsRoute);
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
                        locator<NavigationService>().navigateTo(ContactsRoute);
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
      } else {
        return Container(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // SizedBox(
              //   height: 100,
              //   width: 200,
              //   child: SvgPicture.asset(
              //     'assets/logo.svg',
              //     color: Colors.black,
              //   ),
              // ),
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/ExtraLogo3png.png',
                  // color: Colors.black,
                ),
              ),
              IconButton(onPressed: () {Scaffold.of(context).openEndDrawer();}, icon: Icon(Icons.menu))
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     TextButton(
              //         onPressed: () {
              //           locator<NavigationService>().navigateTo(HomeRoute);
              //         },
              //         child: Text(
              //           'Home',
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         )),
              //     SizedBox(
              //       width: 60,
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           locator<NavigationService>().navigateTo(NewsRoute);
              //         },
              //         child: Text(
              //           'News',
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         )),
              //     SizedBox(
              //       width: 60,
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           locator<NavigationService>().navigateTo(ProjectsRoute);
              //         },
              //         child: Text(
              //           'Projects',
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         )),
              //     SizedBox(
              //       width: 60,
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           locator<NavigationService>().navigateTo(ContactsRoute);
              //         },
              //         child: Text(
              //           'Contact',
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         )),
              //   ],
              // )
            ],
          ),
        );
      }
    } else {
      if (currentWidth > 900) {
        return Container(
          color: Colors.white,
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // SizedBox(
              //   height: 50,
              //   width: 100,
              //   child: SvgPicture.asset(
              //     'assets/logo.svg',
              //     color: Colors.black,
              //   ),
              // ),
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/ExtraLogo3png.png',
                  // color: Colors.black,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        locator<NavigationService>().navigateTo(HomeRoute);
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
                        locator<NavigationService>().navigateTo(NewsRoute);
                      },
                      child: Text(
                        'Новости',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
                  SizedBox(
                    width: 60,
                  ),
                  TextButton(
                      onPressed: () {
                        locator<NavigationService>().navigateTo(ProjectsRoute);
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
                        locator<NavigationService>().navigateTo(ContactsRoute);
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
      } else {
        return Container(
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: SizedBox(
                //   height: 50,
                //   width: 100,
                //   child: SvgPicture.asset(
                //     'assets/logo.svg',
                //     color: Colors.black,
                //   ),
                // ),
                child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/ExtraLogo3png.png',
                  // color: Colors.black,
                ),
              ),
              ),
              IconButton(onPressed: () {Scaffold.of(context).openEndDrawer();}, icon: Icon(Icons.menu))
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     TextButton(
              //         onPressed: () {
              //           locator<NavigationService>().navigateTo(HomeRoute);
              //         },
              //         child: Text(
              //           'Home',
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         )),
              //     SizedBox(
              //       width: 60,
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           locator<NavigationService>().navigateTo(NewsRoute);
              //         },
              //         child: Text(
              //           'News',
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         )),
              //     SizedBox(
              //       width: 60,
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           locator<NavigationService>().navigateTo(ProjectsRoute);
              //         },
              //         child: Text(
              //           'Projects',
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         )),
              //     SizedBox(
              //       width: 60,
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           locator<NavigationService>().navigateTo(ContactsRoute);
              //         },
              //         child: Text(
              //           'Contact',
              //           style: TextStyle(fontSize: 18, color: Colors.black),
              //         )),
              //   ],
              // )
            ],
          ),
        );
      }
    }
  }
}
