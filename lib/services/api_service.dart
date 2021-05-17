import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news.dart';

class ApiService {
  final endPointURL =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=f7084ef49bfb4e18b112f74129914268";

  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.tryParse(endPointURL));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<News> news = body.map((item) => News.fromJson(item)).toList();

      return news;
    } else {
      throw Exception("Can't get the News!");
    }
  }
}
