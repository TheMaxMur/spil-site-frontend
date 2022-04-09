import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/projects_details/projects.dart';

import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:extended_image/extended_image.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

class ProjectDetailsWidget extends StatefulWidget {
  final int projectId;
  final int index;
  ProjectDetailsWidget({Key? key, required this.projectId, required this.index})
      : super(key: key);
  @override
  State<ProjectDetailsWidget> createState() =>
      _ProjectDetailsWidgetState(projectId, index);
}

class _ProjectDetailsWidgetState extends State<ProjectDetailsWidget> {
  int activeIndex = 0;
  _ProjectDetailsWidgetState(this.projectId, this.index);
  final int projectId;
  final int index;
  final projects = Projects.getProjects();

  // элемент списка по прожект айди - 1
  final _projectImages = [
    'assets/details1.jpg',
    'assets/details2.jpg',
    'assets/details3.jpg',
    'assets/details4.jpg',
  ];

  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth > 900) {
      return ProjectDetailsWidget();
    } else {
      return ProjectDetailsMobileWidget();
    }
  }

  SingleChildScrollView ProjectDetailsMobileWidget() {
    // print(Projects.projects[index].prpjectName);
    return SingleChildScrollView(
      child: FutureBuilder(
          future: projects,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (Projects.projects[index].projectImages.length != 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                Projects.projects[index].projectName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  height: 1.2,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Краткое описание проекта',
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1.7,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Project type',
                                  style: TextStyle(
                                      fontSize: 21,
                                      height: 1.2,
                                      fontWeight: FontWeight.w800)),
                              Text(Projects.projects[index].projectTheme,
                                  style: TextStyle(
                                    fontSize: 21,
                                    height: 1.2,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Project creators',
                                  style: TextStyle(
                                      fontSize: 21,
                                      height: 1.2,
                                      fontWeight: FontWeight.w800)),
                              Text(Projects.projects[index].projectCreators,
                                  style: TextStyle(fontSize: 21, height: 1.2))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date',
                                  style: TextStyle(
                                      fontSize: 21,
                                      height: 1.2,
                                      fontWeight: FontWeight.w800)),
                              Text('-',
                                  style: TextStyle(fontSize: 21, height: 1.2))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Projects.projects[index].projectText,
                        style: TextStyle(fontSize: 17, height: 1.7),
                      ),
                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          // child: PhotoViewGallery.builder(
                          //     itemCount: _projectImages.length,
                          //     builder: (context, index) {
                          //       return PhotoViewGalleryPageOptions(
                          //         imageProvider: AssetImage(_projectImages[index]),
                          //         minScale: PhotoViewComputedScale.contained * 0.8,
                          //         maxScale: PhotoViewComputedScale.covered * 0.8,
                          //         heroAttributes: PhotoViewHeroAttributes(tag: _projectImages[index])
                          //       );
                          //     },
                          //     scrollPhysics: BouncingScrollPhysics(),
                          //     backgroundDecoration:
                          //         BoxDecoration(color: Colors.white),
                          //     loadingBuilder: (context, event) => Center(
                          //           child: Container(
                          //             width: 20.0,
                          //             height: 20.0,
                          //             child: CircularProgressIndicator(),
                          //           ),
                          //         )),
                          child: CarouselSlider.builder(
                            carouselController: controller,
                            options: CarouselOptions(
                              initialPage: 0,
                              autoPlay: true,
                              onPageChanged: (index, reason) =>
                                  setState(() => activeIndex = index),
                            ),
                            itemCount:
                                Projects.projects[index].projectImages.length,
                            itemBuilder: (context, index2, realIndex) {
                              final projectImage = Projects
                                  .projects[index].projectImages[index2];
                              return buildImageMobile(projectImage, index2);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      buildIndicator(),
                      const SizedBox(height: 10),
                      buildButtons(),
                      const SizedBox(height: 12),

                      // Center(
                      //   child: CarouselSlider.builder(
                      //     options: CarouselOptions(
                      //       height: 400,
                      //       autoPlay: true,
                      //       onPageChanged: (index, reason) =>
                      //           setState(() => activeIndex = index),
                      //     ),
                      //     itemCount: _projectImages.length,
                      //     itemBuilder: (context, index, realIndex) {
                      //       final projectImage = _projectImages[index];
                      //       return buildImage(projectImage, index);
                      //     },
                      //   ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              Projects.projects[index].projectName,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              'Краткое описание проекта',
                              style: TextStyle(
                                fontSize: 17,
                                height: 1.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Project type',
                                style: TextStyle(
                                    fontSize: 21,
                                    height: 1.2,
                                    fontWeight: FontWeight.w800)),
                            Text(Projects.projects[index].projectTheme,
                                style: TextStyle(
                                  fontSize: 21,
                                  height: 1.2,
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Project creators',
                                style: TextStyle(
                                    fontSize: 21,
                                    height: 1.2,
                                    fontWeight: FontWeight.w800)),
                            Text(Projects.projects[index].projectCreators,
                                style: TextStyle(fontSize: 21, height: 1.2))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date',
                                style: TextStyle(
                                    fontSize: 21,
                                    height: 1.2,
                                    fontWeight: FontWeight.w800)),
                            Text('-',
                                style: TextStyle(fontSize: 21, height: 1.2))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      Projects.projects[index].projectText,
                      style: TextStyle(fontSize: 17, height: 1.7),
                    ),
                  ]),
                );
              }
            } else {
              return CenteredView(
                child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 20.0,
                    width: 20.0),
              );
            }
          }),
    );
  }

  SingleChildScrollView ProjectDetailsWidget() {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: projects,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (Projects.projects[index].projectImages.length != 0) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              Projects.projects[index].projectName,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              'Краткое описание проекта',
                              style: TextStyle(
                                fontSize: 21,
                                height: 1.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('Project type',
                                style: TextStyle(
                                    fontSize: 21,
                                    height: 1.2,
                                    fontWeight: FontWeight.w800)),
                            Text(Projects.projects[index].projectTheme,
                                style: TextStyle(
                                  fontSize: 21,
                                  height: 1.2,
                                ))
                          ],
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Column(
                          children: [
                            Text('Date',
                                style: TextStyle(
                                    fontSize: 21,
                                    height: 1.2,
                                    fontWeight: FontWeight.w800)),
                            Text('-',
                                style: TextStyle(fontSize: 21, height: 1.2))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Project creators',
                                style: TextStyle(
                                    fontSize: 21,
                                    height: 1.2,
                                    fontWeight: FontWeight.w800)),
                            Text(
                              Projects.projects[index].projectCreators,
                              style: TextStyle(fontSize: 21, height: 1.2),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      Projects.projects[index].projectText,
                      style: TextStyle(fontSize: 21, height: 1.7),
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Container(
                        height: 600,
                        width: 600,
                        //   child: PhotoViewGallery.builder(
                        //       itemCount: _projectImages.length,
                        //       builder: (context, index) {
                        //         return PhotoViewGalleryPageOptions(
                        //             imageProvider: AssetImage(_projectImages[index]),
                        //             minScale: PhotoViewComputedScale.contained * 0.8,
                        //             maxScale: PhotoViewComputedScale.covered * 0.8);
                        //       },
                        //       scrollPhysics: BouncingScrollPhysics(),
                        //       backgroundDecoration:
                        //           BoxDecoration(color: Theme.of(context).canvasColor),
                        //       loadingBuilder: (context, event) => Center(
                        //             child: Container(
                        //               width: 20.0,
                        //               height: 20.0,
                        //               child: CircularProgressIndicator(),
                        //             ),
                        //           )),
                        // )
                        //     //     child: PhotoViewGallery.builder(
                        //   scrollPhysics: const BouncingScrollPhysics(),
                        //   builder: (BuildContext context, int index) {
                        //     return PhotoViewGalleryPageOptions(
                        //       imageProvider:
                        //           AssetImage(_projectImages[index]),
                        //       initialScale: PhotoViewComputedScale.contained * 0.8,
                        //       heroAttributes: PhotoViewHeroAttributes(
                        //           tag: _projectImages[index]),
                        //     );
                        //   },
                        //   itemCount: _projectImages.length,
                        // loadingBuilder: (context, event) => Center(
                        //   child: Container(
                        //     width: 20.0,
                        //     height: 20.0,
                        //     child: CircularProgressIndicator(
                        //       value: event == null
                        //           ? 0
                        //           : event.cumulativeBytesLoaded /
                        //               event.expectedTotalBytes!,
                        //     ),
                        //   ),
                        //   ),

                        // )

                        child: CarouselSlider.builder(
                          carouselController: controller,
                          options: CarouselOptions(
                            initialPage: 0,
                            autoPlay: true,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                          itemCount:
                              Projects.projects[index].projectImages.length,
                          itemBuilder: (context, index2, realIndex) {
                            final projectImage =
                                Projects.projects[index].projectImages[index2];
                            return buildImageDesktop(projectImage, index2);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    buildIndicator(),
                    const SizedBox(height: 30),
                    buildButtons(),
                    const SizedBox(height: 32),
                  ],
                );
              } else {
                return Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            Projects.projects[index].projectName,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                              fontSize: 60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Краткое описание проекта',
                            style: TextStyle(
                              fontSize: 21,
                              height: 1.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Project type',
                              style: TextStyle(
                                  fontSize: 21,
                                  height: 1.2,
                                  fontWeight: FontWeight.w800)),
                          Text(Projects.projects[index].projectTheme,
                              style: TextStyle(
                                fontSize: 21,
                                height: 1.2,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      Column(
                        children: [
                          Text('Date',
                              style: TextStyle(
                                  fontSize: 21,
                                  height: 1.2,
                                  fontWeight: FontWeight.w800)),
                          Text('-', style: TextStyle(fontSize: 21, height: 1.2))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Project creators',
                              style: TextStyle(
                                  fontSize: 21,
                                  height: 1.2,
                                  fontWeight: FontWeight.w800)),
                          Text(
                            Projects.projects[index].projectCreators,
                            style: TextStyle(fontSize: 21, height: 1.2),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Projects.projects[index].projectText,
                    style: TextStyle(fontSize: 21, height: 1.7),
                  ),
                ]);
              }
            } else {
              return CenteredView(
                child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 20.0,
                    width: 20.0),
              );
            }
          }),
    );
  }

  Widget buildImageDesktop(String projectImage, int index) => Container(
      height: 600,
      width: 600,
      margin: EdgeInsets.symmetric(horizontal: 1),
      color: Colors.white,
      child: GestureDetector(
        child: Image.network(
          projectImage,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreenDesktop(
              projectImage: projectImage,
            );
          }));
        },
      )
//         child: PinchZoom(
//     child: Image.network(projectImage),
//     resetDuration: const Duration(milliseconds: 0),
//     maxScale: 2.5,
//     onZoomStart: (){Navigator.push(context, MaterialPageRoute(builder: (_) {return DetailScreen(projectImage: projectImage,);}));},
//     onZoomEnd: (){print('Stop zooming');},
// ),
      // child: Image.network(
      //   projectImage,
      //   fit: BoxFit.fitHeight,
      // ),
      );

  Widget buildImageMobile(String projectImage, int index) => Container(
        height: 600,
        width: 600,
        margin: EdgeInsets.symmetric(horizontal: 1),
        color: Colors.white,
        child: GestureDetector(
          child: Image.network(
            projectImage,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreenMobile(
                projectImage: projectImage,
              );
            }));
          },
          // )
//         child: PinchZoom(
//     child: Image.network(projectImage),
//     resetDuration: const Duration(milliseconds: 0),
//     maxScale: 2.5,
//     onZoomStart: (){Navigator.push(context, MaterialPageRoute(builder: (_) {return DetailScreen(projectImage: projectImage,);}));},
//     onZoomEnd: (){print('Stop zooming');},
// ),
          // child: Image.network(
          //   projectImage,
          //   fit: BoxFit.fitHeight,
          // ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        activeIndex: activeIndex,
        count: Projects.projects[index].projectImages.length,
        effect: WormEffect(
          activeDotColor: Colors.black,
        ),
      );
  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildButtons({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: previous,
            child: Icon(
              Icons.arrow_back,
              size: 32,
              color: Colors.black,
            ),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          ),
          stretch
              ? Spacer()
              : SizedBox(
                  width: 32,
                ),
          ElevatedButton(
            onPressed: next,
            child: Icon(Icons.arrow_forward, size: 32, color: Colors.black),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          ),
        ],
      );
  void next() => controller.nextPage();
  void previous() => controller.previousPage();
}

class DetailScreenDesktop extends StatefulWidget {
  final String projectImage;

  DetailScreenDesktop({Key? key, required this.projectImage}) : super(key: key);

  @override
  State<DetailScreenDesktop> createState() =>
      _DetailScreenDesktopState(projectImage);
}

class _DetailScreenDesktopState extends State<DetailScreenDesktop> {
  _DetailScreenDesktopState(String projectImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Container(
            child: Image.network(
              widget.projectImage,
            ),
          ),
        )
        // body: GestureDetector(
        //   child: Center(
        //     child: Hero(
        //       tag: 'imageHero',
        //       child: Image.network(
        //         widget.projectImage,
        //       ),
        //     ),
        //   ),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        );
  }
}

class DetailScreenMobile extends StatefulWidget {
  final String projectImage;

  DetailScreenMobile({Key? key, required this.projectImage}) : super(key: key);

  @override
  State<DetailScreenMobile> createState() =>
      _DetailScreenMobileState(projectImage);
}

class _DetailScreenMobileState extends State<DetailScreenMobile> {
  _DetailScreenMobileState(String projectImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Container(
            child: PinchZoom(
              child: Image.network(widget.projectImage),
              resetDuration: const Duration(milliseconds: 0),
              maxScale: 2.5,
              onZoomStart: () {},
              onZoomEnd: () {},
            ),
          ),
        )
        // body: GestureDetector(
        //   child: Center(
        //     child: Hero(
        //       tag: 'imageHero',
        //       child: Image.network(
        //         widget.projectImage,
        //       ),
        //     ),
        //   ),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        );
  }
}
