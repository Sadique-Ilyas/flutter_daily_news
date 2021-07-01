import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:flutter_daily_news/Services/API%20Services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var generalNewsList = <Datum>[].obs;
  var businessNewsList = <Datum>[].obs;
  var entertainmentNewsList = <Datum>[].obs;
  var healthNewsList = <Datum>[].obs;
  var scienceNewsList = <Datum>[].obs;
  var sportsNewsList = <Datum>[].obs;
  var technologyNewsList = <Datum>[].obs;
  @override
  void onInit() {
    fetchNews("general");
    fetchNews("business");
    fetchNews("entertainment");
    fetchNews("health");
    fetchNews("science");
    fetchNews("sports");
    fetchNews("technology");
    super.onInit();
  }

  void fetchNews(String category) async {
    try {
      isLoading(true);
      var news = await ApiManager.fetchNews(category);
      if (news != null) {
        if (category == "general") {
          generalNewsList.assignAll(news);
        } else if (category == "business") {
          businessNewsList.assignAll(news);
        } else if (category == "entertainment") {
          entertainmentNewsList.assignAll(news);
        } else if (category == "health") {
          healthNewsList.assignAll(news);
        } else if (category == "science") {
          scienceNewsList.assignAll(news);
        } else if (category == "sports") {
          sportsNewsList.assignAll(news);
        } else if (category == "technology") {
          technologyNewsList.assignAll(news);
        }
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading(false);
    }
  }
}
