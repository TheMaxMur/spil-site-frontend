import 'package:flutter/material.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/navigation_bar/adaptive_navigation_bar.dart';
import 'package:web_app/widgets/home_details/home_details.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
              fit: StackFit.expand,
              children: [Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        HomeDetails(),
                      ],
                    ),
                  ),
                ),
              ),
              ],
            );
  }
}
