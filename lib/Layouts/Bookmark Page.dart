import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:flutter_daily_news/Models/bookmark_model.dart';
import 'package:flutter_daily_news/Widgets/Bookmark%20Page%20Widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmarks',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.bookmark,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          )
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: BookmarkPageWidgets().myValueListenableBuilder(),
    );
  }
}
