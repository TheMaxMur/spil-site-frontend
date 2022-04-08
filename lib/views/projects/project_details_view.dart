import 'package:flutter/material.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/navigation_bar/adaptive_navigation_bar.dart';
import 'package:web_app/widgets/projects_details/project_details_widget.dart';

class ProjectDetailsView extends StatelessWidget {
  final int projectId;
  final int index;
  const ProjectDetailsView({Key? key, required this.projectId, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
              children: [ProjectDetailsWidget(projectId: projectId, index: index),]
            );
  }
}