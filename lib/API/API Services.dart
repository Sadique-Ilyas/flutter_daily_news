import 'package:flutter_daily_news/Models/News%20Model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<List<Datum>> fetchNews(String category) async {
    var url =
        "http://api.mediastack.com/v1/news?access_key=260a8f652b154e80302d88681b23cf6d&languages=en&categories=$category";
    var client = http.Client();
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsModelFromJson(jsonString).data;
    }
    return null;
  }
}
