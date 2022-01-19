import 'package:cached_network_image/cached_network_image.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Controller/Animation%20Controller.dart';
import 'package:flutter_daily_news/Layouts/Bookmark%20Page.dart';
import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:flutter_daily_news/Models/bookmark_model.dart';
import 'package:flutter_daily_news/Services/URL%20Launch%20Services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

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
          Container(
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(news.title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Source: "),
                            Flexible(
                              child: Card(
                                color: Colors.orange.shade100,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                      news.source != null
                                          ? news.source
                                          : "Unknown",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Category: "),
                            Card(
                              color: Colors.blue.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                    news.category != null
                                        ? news.category
                                            .toString()
                                            .split('.')
                                            .last
                                        : "Unknown",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Author: "),
                            Card(
                              color: Colors.yellow.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                    news.author != null
                                        ? news.author
                                        : "Unknown",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Country: "),
                            Card(
                              color: Colors.green.shade100,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                    news.country != null
                                        ? news.country
                                            .toString()
                                            .split('.')
                                            .last
                                        : "Unknown",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
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
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Published At: "),
                          Card(
                            color: Colors.red.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                  news.publishedAt != null
                                      ? formatter.format(news.publishedAt)
                                      : "Unknown",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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
                                      text: news.url != null
                                          ? news.url
                                          : "Unknown",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
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

  addBookmark(Datum news) {
    String author = news.author;
    String title = news.title;
    String description = news.description;
    String url = news.url;
    String source = news.source;
    String image = news.image;
    String category = news.category.toString().split('.').last ?? null;
    String language = news.language.toString().split('.').last ?? null;
    String country = news.country.toString().split('.').last ?? null;
    String publishedAt = formatter.format(news.publishedAt) ?? null;
    BookMarkModel bookednews = BookMarkModel(author, title, description, url,
        source, image, category, language, country, publishedAt);
    Hive.box('bookmarks').add(bookednews).then((value) => Get.snackbar("", "",
            titleText: Text(
              'Bookmark Added !',
              style: TextStyle(color: Colors.white),
            ),
            messageText: Text(
              'Tap to see bookmarks !',
              style: TextStyle(color: Colors.white),
            ), onTap: (snack) {
          Get.to(() => BookmarkPage());
        },
            icon: Icon(Icons.bookmark),
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10)));
  }

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
            Share.share(news.url);
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
                } else {
                  favController.forward();
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
                if (myAnimationController.isBook.value) {
                  bookController.reverse();
                } else {
                  bookController.forward();
                  addBookmark(news);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
