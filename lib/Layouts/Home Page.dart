import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Controller/News%20Controller.dart';
import 'package:flutter_daily_news/Layouts/Home%20Page%20Widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: 0,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: HomePageWidgets().myAppBar(),
          backgroundColor: Colors.white,
          body: HomePageWidgets().myTabBarView()),
    );
  }
}

/*
  Obx(() => newsController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Trending",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Widgets().myCarouselSlider(),
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Widgets().myListView()
                  ],
                ))
*/
