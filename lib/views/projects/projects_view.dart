import 'package:flutter/material.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/navigation_bar/adaptive_navigation_bar.dart';
import 'package:web_app/widgets/projects_details/project_list_widget.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
            fit: StackFit.expand,
              children: [ProjectListView(),],
            );
  }
}