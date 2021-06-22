import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Layouts/Detailed%20Page%20Widgets.dart';
import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:get/get.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key key}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  Datum news = Datum();

  @override
  void initState() {
    news = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          DetailedPageWidgets().mySliverAppBar(news),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            ListTile(
              title: Text("Neckertal pasture hillside, Switzerland.",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              subtitle: Text(
                "The concept of 'cultural landscapes' can be found in the European"
                " tradition of landscape painting.[2] From the 16th century"
                " onwards, many European artists painted landscapes in favor"
                " of people, diminishing the people in their paintings to figures "
                "subsumed within broader, regionally specific landscapes.The "
                "concept of 'cultural landscapes' can be found in the European "
                "tradition of landscape painting.[2] From the 16th century onwards,"
                " many European artists painted landscapes in favor of people,"
                " diminishing the people in their paintings to figures subsumed "
                "within broader, regionally specific landscapes.The concept of "
                "'cultural landscapes' can be found in the European tradition of "
                "landscape painting.[2] From the 16th century onwards, many "
                "European artists painted landscapes in favor of people, diminishing "
                "the people in their paintings to figures subsumed within broader,"
                " regionally specific landscapes.The concept of 'cultural landscapes'"
                " can be found in the European tradition of landscape painting.[2] "
                "From the 16th century onwards, many European artists painted landscapes"
                " in favor of people, diminishing the people in their paintings to figures"
                " subsumed within broader, regionally specific landscapes.The concept"
                " of 'cultural landscapes' can be found in the European tradition of"
                " landscape painting.[2] From the 16th century onwards, many European"
                " artists painted landscapes in favor of people, diminishing the people"
                " in their paintings to figures subsumed within broader, regionally"
                " specific landscapes.The concept of 'cultural landscapes' can be"
                " found in the European tradition of landscape painting.[2] "
                "From the 16th century onwards, many European artists painted "
                "landscapes in favor of people, diminishing the people in their"
                " paintings to figures subsumed within broader, regionally specific"
                " landscapes.The concept of 'cultural landscapes' can be found in "
                "the European tradition of landscape painting.[2] From the 16th "
                "century onwards, many European artists painted landscapes in favor"
                " of people, diminishing the people in their paintings to figures "
                "subsumed within broader, regionally specific landscapes.The concept"
                " of 'cultural landscapes' can be found in the European tradition "
                "of landscape painting.[2] From the 16th century onwards, many "
                "European artists painted landscapes in favor of people, diminishing"
                " the people in their paintings to figures subsumed within broader,"
                " regionally specific landscapes.The concept of 'cultural landscapes'"
                " can be found in the European tradition of landscape painting.[2]"
                " From the 16th century onwards, many European artists painted landscapes"
                " in favor of people, diminishing the people in their paintings to figures"
                " subsumed within broader, regionally specific landscapes.The concept of "
                "'cultural landscapes' can be found in the European tradition of landscape "
                "painting.[2] From the 16th century onwards, many European artists painted "
                "landscapes in favor of people, diminishing the people in their paintings "
                "to figures subsumed within broader, regionally specific landscapes."
                "The concept of 'cultural landscapes' can be found in the European tradition "
                "of landscape painting.[2] From the 16th century onwards, many European "
                "artists painted landscapes in favor of people, diminishing the people"
                " in their paintings to figures subsumed within broader, regionally specific"
                " landscapes.The concept of 'cultural landscapes' can be found in the "
                "European tradition of landscape painting.[2] From the 16th century onwards,"
                " many European artists painted landscapes in favor of people, diminishing"
                " the people in their paintings to figures subsumed within broader,"
                " regionally specific landscapes.The concept of 'cultural landscapes' can"
                " be found in the European tradition of landscape painting.[2] From the "
                "16th century onwards, many European artists painted landscapes in favor "
                "of people, diminishing the people in their paintings to figures subsumed"
                " within broader, regionally specific landscapes.The concept of 'cultural"
                " landscapes' can be found in the European tradition of landscape painting."
                "[2] From the 16th century onwards, many European artists painted landscapes"
                " in favor of people, diminishing the people in their paintings to figures "
                "subsumed within broader, regionally specific landscapes.",
                style: TextStyle(color: Colors.black),
              ),
            )
          ])),
        ],
      ),
    );
  }
}
