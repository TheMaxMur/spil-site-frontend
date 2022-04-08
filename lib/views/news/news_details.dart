import 'package:flutter/material.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/navigation_bar/adaptive_navigation_bar.dart';
import 'package:web_app/widgets/projects_details/project_details_widget.dart';

import '../../widgets/news_view/news_details_widget.dart';

class NewsDetailsView extends StatelessWidget {
  final int newsId;
  final int index;
  const NewsDetailsView({Key? key, required this.newsId, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
              children: [NewsDetailsWidget(newsId: newsId, index: index),]
            );
  }
}