import 'package:flutter/material.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/projects_details/project_list_view_model.dart';
import 'package:web_app/widgets/projects_details/projects.dart';

// import '../../locator.dart';
// import '../../services/navigation_service.dart';

class ProjectListView extends StatefulWidget {
  ProjectListView({Key? key}) : super(key: key);
  @override
  State<ProjectListView> createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  void _onProjectTap(int index) {
    final id = Projects.projects[index].id;
    ProjectListViewModel().navigateToProject(id, index);
  }
  Future<List> projectInfo(index) async {
    final List project = await Projects.getProjects();

    return project;
  }

  // Future<List> getList(project, index) async {
  //   List currentProject = project[index];
  //   return currentProject;
  // }
  
  final index = 0;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    Future<List> project = projectInfo(index);
    if (currentWidth > 900) {
    return FutureBuilder<List>(
      future: projectInfo(index),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length != 0)
          {

          return 
          GridView.builder(
        itemCount: snapshot.data!.length,
        primary: false,
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          final selectProject = snapshot.data![index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.2))),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () => _onProjectTap(index),
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data![index].assetsImage,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 44,
                        child: Column(
                          children: [
                            Flexible(
                              child: Text(
                                snapshot.data![index].projectName,
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
    else if (currentWidth < 900 && currentWidth > 600) {
      return FutureBuilder<List>(
      future: projectInfo(index),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length != 0) {
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
          final selectProject = snapshot.data![index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.2))),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () => _onProjectTap(index),
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data![index].assetsImage,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 44,
                        child: Column(
                          children: [
                            Flexible(
                              child: Text(
                                snapshot.data![index].projectName,
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
    else{
      return FutureBuilder<List>(
      future: projectInfo(index),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length != 0) {
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
          final selectProject = snapshot.data![index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.2))),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () => _onProjectTap(index),
                child: Column(
                  children: [
                    Image.network(
                      snapshot.data![index].assetsImage,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 44,
                        child: Column(
                          children: [
                            Flexible(
                              child: Text(
                                snapshot.data![index].projectName,
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
          );
        },
      );
          }
          else{
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

    // return FutureBuilder(future: project, builder: (context, snapshot){
    //   if (project != null){
    //     return Container(child: Text(project));
    //   }
    // });

    // final currentWidth = MediaQuery.of(context).size.width;
    // if (currentWidth > 900) {
    //   return GridView.builder(
    //     itemCount: Projects.projects.length,
    //     primary: false,
    //     padding: const EdgeInsets.all(20),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //       crossAxisCount: 3,
    //     ),
    //     itemBuilder: (BuildContext context, int index) {
    //       final selectProject = project[index];
    //       return Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //               border: Border.all(color: Colors.black.withOpacity(0.2))),
    //           clipBehavior: Clip.hardEdge,
    //           child: InkWell(
    //             onTap: () => _onProjectTap(index),
    //             child: Column(
    //               children: [
    //                 Image(
    //                   image: AssetImage(project.assetsImage[0]),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Container(
    //                     height: 44,
    //                     child: Column(
    //                       children: [
    //                         Flexible(
    //                           child: Text(
    //                             project.projectName,
    //                             maxLines: 2,
    //                             overflow: TextOverflow.ellipsis,
    //                             style: TextStyle(fontWeight: FontWeight.w800),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // } else if (currentWidth <= 900 && currentWidth > 600) {
    //   return GridView.builder(
    //     itemCount: Projects.projects.length,
    //     primary: false,
    //     padding: const EdgeInsets.all(20),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //       crossAxisCount: 2,
    //     ),
    //     itemBuilder: (BuildContext context, int index) {
    //       final project = Projects.projects[index];
    //       return Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //               border: Border.all(color: Colors.black.withOpacity(0.2))),
    //           clipBehavior: Clip.hardEdge,
    //           child: Material(
    //             child: InkWell(
    //               onTap: () => _onProjectTap(index),
    //               child: Column(
    //                 children: [
    //                   Image(
    //                     image: AssetImage(project.assetsImage[0]),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: SizedBox(
    //                       height: 44,
    //                       child: Column(
    //                         children: [
    //                           Row(
    //                             children: [
    //                               Flexible(
    //                                 fit: FlexFit.loose,
    //                                 child: Text(
    //                                   project.projectName,
    //                                   maxLines: 2,
    //                                   overflow: TextOverflow.ellipsis,
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.w800),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // } else {
    //   return GridView.builder(
    //     itemCount: Projects.projects.length,
    //     primary: false,
    //     padding: const EdgeInsets.all(20),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //       crossAxisCount: 1,
    //     ),
    //     itemBuilder: (BuildContext context, int index) {
    //       final project = Projects.projects[index];
    //       return Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //               border: Border.all(color: Colors.black.withOpacity(0.2))),
    //           clipBehavior: Clip.hardEdge,
    //           child: InkWell(
    //             onTap: () => _onProjectTap(index),
    //             child: Column(
    //               children: [
    //                 Image(
    //                   image: AssetImage(project.assetsImage[0]),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: SizedBox(
    //                     height: 44,
    //                     child: Row(
    //                       children: [
    //                         Flexible(
    //                           child: Text(
    //                             project.projectName,
    //                             maxLines: 2,
    //                             overflow: TextOverflow.ellipsis,
    //                             style: TextStyle(fontWeight: FontWeight.w800),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   );
    // }
  }
}
