import 'package:flutter_daily_news/API/API%20Services.dart';
import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var generalNewsList = List<Datum>().obs;
  var businessNewsList = List<Datum>().obs;
  var entertainmentNewsList = List<Datum>().obs;
  var healthNewsList = List<Datum>().obs;
  var scienceNewsList = List<Datum>().obs;
  var sportsNewsList = List<Datum>().obs;
  var technologyNewsList = List<Datum>().obs;

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
