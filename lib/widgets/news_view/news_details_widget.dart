import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_app/widgets/centered_view/centered_view.dart';
import 'package:web_app/widgets/news_view/news.dart';
// import 'package:web_app/widgets/projects_details/projects.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

class NewsDetailsWidget extends StatefulWidget {
  final int newsId;
  final int index;
  NewsDetailsWidget({Key? key, required this.newsId, required this.index})
      : super(key: key);
  @override
  State<NewsDetailsWidget> createState() =>
      _NewsDetailsWidgetState(newsId, index);
}

class _NewsDetailsWidgetState extends State<NewsDetailsWidget> {
  int activeIndex = 0;
  _NewsDetailsWidgetState(this.newsId, this.index);
  final int newsId;
  final int index;
  final news = News.getNews();

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
      return NewsDetailsWidget();
    } else {
      return MobileNewsDetailsWidget();
    }
  }

  SingleChildScrollView NewsDetailsWidget() {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: news,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (News.news[index].newsImages.length != 0) {
                return Column(
                  children: [
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
                              News.news[index].newsName,
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
                    
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      News.news[index].newsText,
                      style: TextStyle(fontSize: 21, height: 1.7),
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Container(
                        height: 700,
                        width: 700,
                        child: CarouselSlider.builder(
                          carouselController: controller,
                          options: CarouselOptions(
                            initialPage: 0,
                            autoPlay: true,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                          itemCount: News.news[index].newsImages.length,
                          itemBuilder: (context, index2, realIndex) {
                            final newsImage =
                                News.news[index].newsImages[index2];
                            return buildImageDesktop(newsImage, index2);
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
                return Column(
                  children: [
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
                              News.news[index].newsName,
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
                    
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      News.news[index].newsText,
                      style: TextStyle(fontSize: 21, height: 1.7),
                    ),
                    const SizedBox(height: 32),
                  ],
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

  SingleChildScrollView MobileNewsDetailsWidget() {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: news,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (News.news[index].newsImages.length != 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
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
                                News.news[index].newsName,
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
                      
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        News.news[index].newsText,
                        style: TextStyle(fontSize: 21, height: 1.7),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: Container(
                          height: 300,
                          width: 500,
                          child: CarouselSlider.builder(
                            carouselController: controller,
                            options: CarouselOptions(
                              initialPage: 0,
                              autoPlay: true,
                              onPageChanged: (index, reason) =>
                                  setState(() => activeIndex = index),
                            ),
                            itemCount: News.news[index].newsImages.length,
                            itemBuilder: (context, index2, realIndex) {
                              final newsImage =
                                  News.news[index].newsImages[index2];
                              return buildImageMobile(newsImage, index2);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      buildIndicator(),
                      const SizedBox(height: 10),
                      buildButtons(),
                      const SizedBox(height: 12),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(children: [
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
                              News.news[index].newsName,
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
                    
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      News.news[index].newsText,
                      style: TextStyle(fontSize: 21, height: 1.7),
                    ),
                    const SizedBox(height: 32),
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

    Widget buildImageDesktop(String newsImage, int index) => Container(
      height: 700,
      width: 800,
      margin: EdgeInsets.symmetric(horizontal: 1),
      color: Colors.white,
      child: GestureDetector(
        child: Image.network(
          newsImage,
          fit: BoxFit.fitHeight,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreenDesktop(
              newsImage: newsImage,
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

  Widget buildImageMobile(String newsImage, int index) => Container(
        height: 700,
        width: 800,
        margin: EdgeInsets.symmetric(horizontal: 1),
        color: Colors.white,
        child: GestureDetector(
          child: Image.network(
            newsImage,
            fit: BoxFit.fitHeight,
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreenMobile(
                newsImage: newsImage,
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

  Widget buildImage(String newsImage, int index) => Container(
        height: 700,
        width: 800,
        margin: EdgeInsets.symmetric(horizontal: 1),
        color: Colors.white,
        child: Image.network(
          newsImage,
          fit: BoxFit.fitHeight,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        activeIndex: activeIndex,
        count: News.news[index].newsImages.length,
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
  final String newsImage;

  DetailScreenDesktop({Key? key, required this.newsImage}) : super(key: key);

  @override
  State<DetailScreenDesktop> createState() =>
      _DetailScreenDesktopState(newsImage);
}

class _DetailScreenDesktopState extends State<DetailScreenDesktop> {
  _DetailScreenDesktopState(String newsImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
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
            color: Colors.white,
            child: Image.network(
              widget.newsImage,
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
  final String newsImage;

  DetailScreenMobile({Key? key, required this.newsImage}) : super(key: key);

  @override
  State<DetailScreenMobile> createState() =>
      _DetailScreenMobileState(newsImage);
}

class _DetailScreenMobileState extends State<DetailScreenMobile> {
  _DetailScreenMobileState(String newsImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
              child: Image.network(widget.newsImage),
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