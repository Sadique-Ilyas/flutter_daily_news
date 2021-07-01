import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Models/bookmark_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookmarkPageWidgets {
  myValueListenableBuilder() {
    return ValueListenableBuilder(
      valueListenable: Hive.box('bookmarks').listenable(),
      builder: (BuildContext context, Box box, Widget child) {
        if (box.values.isNotEmpty) {
          return myListView(box);
        }
        return Center(
            child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(width: 1, color: Colors.black)),
                child: Text('No Bookmarks Added !')));
      },
    );
  }

  ListView myListView(Box<dynamic> box) {
    return ListView.builder(
      itemCount: box.values.length,
      itemBuilder: (BuildContext context, int index) {
        BookMarkModel news = box.getAt(index);
        return myListItem(news);
      },
    );
  }

  Widget myListItem(BookMarkModel news) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.blue,
                  child: CachedNetworkImage(
                    imageUrl: news.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  news.title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      news.source ?? "Unknown",
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text(news.publishedAt ?? "Unknown")
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
