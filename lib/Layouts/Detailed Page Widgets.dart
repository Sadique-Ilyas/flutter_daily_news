import 'package:cached_network_image/cached_network_image.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Controller/Animation%20Controller.dart';
import 'package:flutter_daily_news/Models/Favourites%20Bookmarks.dart';
import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:flutter_daily_news/Services/URL%20Launch%20Services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailedPageWidgets {
  mySliverAppBar(Datum news) {
    return SliverAppBar(
      // title: Text('Landscapes'),
      stretch: true,
      backgroundColor: Colors.green.shade100,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: news.image,
          fit: BoxFit.fill,
        ),
        stretchModes: <StretchMode>[StretchMode.zoomBackground],
      ),
      floating: true,
    );
  }

  final DateFormat formatter = DateFormat('dd-MMM-yyyy');

  mySliverList(Datum news) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text("Source: "),
                          Card(
                            color: Colors.orange.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(news.source ?? "Unknown",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Category: "),
                          Card(
                            color: Colors.blue.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  news.category.toString().split('.').last ??
                                      "Unknown",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text("Author: "),
                          Card(
                            color: Colors.yellow.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(news.author ?? "Unknown",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Country: "),
                          Card(
                            color: Colors.green.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  news.country.toString().split('.').last ??
                                      "Unknown",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.description,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text("Language: "),
                          Card(
                            color: Colors.cyan.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  news.language.toString().split('.').last ??
                                      "Unknown",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Published At: "),
                          Card(
                            color: Colors.red.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  formatter.format(news.publishedAt) ??
                                      "Unknown",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Article Url: "),
                          Expanded(
                            child: Card(
                              color: Colors.purple.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      maxLines: 2,
                                      text: TextSpan(
                                          text: news.url,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              UrlLaunchServices()
                                                  .launchURL(news.url);
                                            }),
                                    ),
                                    Text(
                                      'Tap on link to view Articles',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontStyle: FontStyle.italic),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Floating Action Button Circular Menu

  // GetX Animation Controller
  final MyAnimationController myAnimationController =
      Get.put(MyAnimationController());

  myfabCircularMenu(
      AnimationController favController,
      AnimationController bookController,
      Animation<Color> favColorAnimation,
      Animation<double> favSizeAnimation,
      Animation<Color> bookColorAnimation,
      Animation<double> bookSizeAnimation,
      Datum news) {
    return FabCircularMenu(
      ringDiameter: 350.0,
      alignment: Alignment.bottomRight,
      ringColor: Colors.blue.shade300,
      fabColor: Colors.blue.shade300,
      fabOpenIcon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      fabCloseIcon: Icon(
        Icons.close,
        color: Colors.white,
      ),
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.white,
          ),
          iconSize: 25,
          onPressed: () {
            Fluttertoast.showToast(msg: 'Tapped !');
          },
        ),
        AnimatedBuilder(
          animation: favController,
          builder: (context, child) {
            return IconButton(
              icon: Icon(
                Icons.favorite,
              ),
              iconSize: favSizeAnimation.value,
              color: favColorAnimation.value,
              onPressed: () {
                if (myAnimationController.isFav.value) {
                  favController.reverse();
                  FavouritesBookmarks().favNews.remove(news);
                } else {
                  favController.forward();
                  // FavouritesBookmarks().favNews.add(news);
                  // Fluttertoast.showToast(msg: "Added to Favourites !");
                  // debugPrint("Added:\n${FavouritesBookmarks().favNews.isNotEmpty.toString()}");
                }
              },
            );
          },
        ),
        AnimatedBuilder(
          animation: bookController,
          builder: (context, child) {
            return IconButton(
              icon: Icon(
                Icons.bookmark,
              ),
              iconSize: bookSizeAnimation.value,
              color: bookColorAnimation.value,
              onPressed: () {
                myAnimationController.isBook.value
                    ? bookController.reverse()
                    : bookController.forward();
              },
            );
          },
        ),
      ],
    );
  }
}
