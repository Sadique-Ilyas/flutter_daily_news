import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Models/bookmark_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookmarkPageWidgets {
  GlobalKey<AnimatedListState> _key = GlobalKey();

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

  Widget myListView(Box<dynamic> box) {
    return AnimatedList(
      key: _key,
      initialItemCount: box.values.length,
      itemBuilder: (context, index, animation) {
        var item = box.values.toList().reversed;
        BookMarkModel news = item.elementAt(index);
        return myListItem(news, index, animation, box.values.length);
      },
    );
  }

  Widget myListItem(
      BookMarkModel news, int index, Animation<double> animation, int length) {
    Tween<Offset> tween = Tween(begin: Offset(0, 0), end: Offset(1, 0));
    return ScaleTransition(
      scale: animation,
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
            child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () async {
                    _removeItem(news, index, length);
                  },
                  icon: Icon(Icons.close)),
            ),
          )
        ],
      ),
    );
  }

  void _removeItem(BookMarkModel news, int index, int length) async {
    await Hive.box('bookmarks').deleteAt(length - index - 1);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return myListItem(news, index, animation, length);
    };
    _key.currentState.removeItem(index, builder);
  }
}
