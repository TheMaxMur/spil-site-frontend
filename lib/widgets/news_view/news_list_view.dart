import 'package:flutter/material.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/news_view/news_list_view_model.dart';
// import 'package:web_app/widgets/projects_details/project_list_view_model.dart';
import 'package:web_app/widgets/news_view/news.dart';

import '../centered_view/centered_view.dart';
import 'news.dart';

class NewsListView extends StatefulWidget {
  NewsListView({Key? key}) : super(key: key);

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  void _onNewsTap(int index) {
    final id = News.news[index].id;
    NewsListViewModel().navigateToNews(id, index);
  }
  Future<List> newsInfo(index) async {
    final List news = await News.getNews();
    return news;
  }

  // Future<List> getList(project, index) async {
  //   List currentProject = project[index];
  //   return currentProject;
  // }
  
  final index = 0;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth > 900) {
    return  FutureBuilder<List>(
      future: newsInfo(index),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length != 0){
          return 
          GridView.builder(
        itemCount: snapshot.data!.length,
        primary: false,
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          final selectNews = snapshot.data![index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 500, maxWidth: 500),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.2))),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                   onTap: () => _onNewsTap(index),
                  child: Column(
                    children: [
                      Image.network(
                        snapshot.data![index].assetsImage,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 44,
                          child: Column(
                            children: [
                              Flexible(
                                child: Text(
                                  snapshot.data![index].newsName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
          }
          else{
            return Center(child: Container( child: Text('В данном разделе пока пусто...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)));
          }
        } else {
          return CenteredView(
            child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 20.0,
                    width: 20.0),
          );
        }
      }
    );
  }
  else {
    return  FutureBuilder<List>(
      future: newsInfo(index),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length != 0){
          return 
          GridView.builder(
        itemCount: snapshot.data!.length,
        primary: false,
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          final selectNews = snapshot.data![index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 500, maxWidth: 500),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.2))),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                   onTap: () => _onNewsTap(index),
                  child: Column(
                    children: [
                      Image.network(
                        snapshot.data![index].assetsImage,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 44,
                          child: Column(
                            children: [
                              Flexible(
                                child: Text(
                                  snapshot.data![index].newsName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
          }
          else {
            return Center(child: Container( child: Text('В данном разделе пока пусто...', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)));
          }
        } else {
          return CenteredView(
            child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 20.0,
                    width: 20.0),
          );
        }
      }
    );
  }
  }
}