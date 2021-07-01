import 'package:flutter/material.dart';
import 'package:flutter_daily_news/Layouts/Home%20Page.dart';
import 'package:flutter_daily_news/Models/bookmark_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentsDirectory.path);
  Hive.registerAdapter(BookMarkModelAdapter());
  await Hive.openBox('bookmarks');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
