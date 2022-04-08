import 'package:flutter/material.dart';
import 'package:web_app/widgets/projects_details/project_list_widget.dart';

class ProjectsDetails extends StatelessWidget {
  const ProjectsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Проекты',
            style: TextStyle(fontWeight: FontWeight.w800, height: 0.9, fontSize: 80),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '1. ... ;',
            style: TextStyle(fontSize: 21, height: 1.7),
          ),
        ],
      ),
    );
  }
}