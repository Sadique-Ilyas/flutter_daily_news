import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Controller/Animation%20Controller.dart';
import 'package:flutter_daily_news/Layouts/Detailed%20Page%20Widgets.dart';
import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:get/get.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key key}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage>
    with TickerProviderStateMixin {
  Datum news = Datum();

  // GetX Animation Controller
  final MyAnimationController myAnimationController =
      Get.put(MyAnimationController());

  //FAB Icon Animation
  AnimationController _favController;
  AnimationController _bookmarkController;
  Animation<Color> _favColorAnimation;
  Animation<double> _favSizeAnimation;
  Animation<Color> _bookColorAnimation;
  Animation<double> _bookSizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    news = Get.arguments;

    // Animation Controller
    _favController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _bookmarkController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Color Tween
    _favColorAnimation = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_favController);
    _bookColorAnimation = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_bookmarkController);

    // Size Tween
    _favSizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 25, end: 45), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 45, end: 35), weight: 50)
    ]).animate(_favController);
    _bookSizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 25, end: 45), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 45, end: 35), weight: 50)
    ]).animate(_bookmarkController);

    _favController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        myAnimationController.isFav(true);
      }
      if (status == AnimationStatus.dismissed) {
        myAnimationController.isFav(false);
      }
    });

    _bookmarkController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        myAnimationController.isBook(true);
      }
      if (status == AnimationStatus.dismissed) {
        myAnimationController.isBook(false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DetailedPageWidgets().myfabCircularMenu(
          _favController,
          _bookmarkController,
          _favColorAnimation,
          _favSizeAnimation,
          _bookColorAnimation,
          _bookSizeAnimation,
          news),
      body: CustomScrollView(
        slivers: <Widget>[
          DetailedPageWidgets().mySliverAppBar(news),
          SliverList(
              delegate: SliverChildListDelegate(
                  <Widget>[DetailedPageWidgets().mySliverList(news)])),
        ],
      ),
    );
  }
}
