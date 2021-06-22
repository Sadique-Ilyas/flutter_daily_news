import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Models/News%20Model.dart';

class DetailedPageWidgets {
  mySliverAppBar(Datum news) {
    return SliverAppBar(
      // title: Text('Landscapes'),
      stretch: true,
      backgroundColor: Colors.green.shade100,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          news.image,
          fit: BoxFit.fill,
        ),
        stretchModes: <StretchMode>[StretchMode.blurBackground],
      ),
      floating: true,
      pinned: false,
    );
  }
}
