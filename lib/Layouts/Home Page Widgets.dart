import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Controller/News%20Controller.dart';
import 'package:flutter_daily_news/Layouts/Detailed%20Page.dart';
import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class HomePageWidgets {
  final NewsController newsController = Get.put(NewsController());

  //Tabs
  List<Tab> myTabs = [
    Tab(
      text: "General",
    ),
    Tab(
      text: "Business",
    ),
    Tab(
      text: "Entertainment",
    ),
    Tab(
      text: "Health",
    ),
    Tab(
      text: "Science",
    ),
    Tab(
      text: "Sports",
    ),
    Tab(
      text: "Technology",
    ),
  ];

  // App Bar
  myAppBar() {
    return AppBar(
      title: Text(
        "Daily News",
        style: TextStyle(color: Colors.blueAccent),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      bottom: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          // indicatorColor: Colors.blue,
          indicator: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelColor: Colors.white,
          tabs: myTabs),
    );
  }

  // Carousel Slider
  myCarouselSlider(RxList<Datum> news) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: news.map((news) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: news.title);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      news.image != null
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Image.network(
                                news.image,
                                fit: BoxFit.fill,
                                height: double.infinity,
                                width: double.infinity,
                              ),
                            )
                          : FlutterLogo(
                              style: FlutterLogoStyle.horizontal,
                              size: double.maxFinite,
                            ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.only(
                              left: 5, bottom: 5, right: 5, top: 3),
                          child: Text(news.title,
                              style: TextStyle(color: Colors.white),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                        ),
                      )
                    ],
                  )),
            );
          },
        );
      }).toList(),
    );
  }

  final DateFormat formatter = DateFormat('dd-MMM-yyyy');

  // List View
  myListView(RxList<Datum> news) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  news[index].title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  "Source: ${news[index].source}",
                  style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                ),
                dense: true,
                leading: Container(
                  width: 70,
                  height: double.infinity,
                  child: news[index].image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            news[index].image,
                            fit: BoxFit.fill,
                          ),
                        )
                      : FlutterLogo(),
                ),
                onTap: () {
                  Get.to(() => DetailedPage(), arguments: news[index]);
                },
              ),
            );
          },
          itemCount: news.length,
        ),
      ),
    );
  }

  // Tab Bar Screen
  myTabBarView() {
    return TabBarView(children: [
      tabView(newsController.generalNewsList),
      tabView(newsController.businessNewsList),
      tabView(newsController.entertainmentNewsList),
      tabView(newsController.healthNewsList),
      tabView(newsController.scienceNewsList),
      tabView(newsController.sportsNewsList),
      tabView(newsController.technologyNewsList),
    ]);
  }

  tabView(RxList news) {
    return Obx(() => newsController.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "Trending",
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 10,
              ),
              myCarouselSlider(news),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Latest News",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              myListView(news)
            ],
          ));
  }
}

/*
  Card(
                child: Container(
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 70,
                          child: newsController.newsList[index].image != null
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: Image.network(
                                    newsController.newsList[index].image,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                )
                              : FlutterLogo(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              newsController.newsList[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Published At: ${formatter.format(newsController.newsList[index].publishedAt)}",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: EdgeInsets.all(8)),
              ),
*/
