import 'package:flutter/material.dart';
import 'package:news_app/services/api_service.dart';
import '../../models/news.dart';
import '../../widgets/primary_card.dart';
import '../read_news_view.dart';

class TrendingTabView extends StatefulWidget {
  @override
  _TrendingTabViewState createState() => _TrendingTabViewState();
}

class _TrendingTabViewState extends State<TrendingTabView> {
  Future<List<News>> fetchNews;

  @override
  void initState() {
    super.initState();
    fetchNews = ApiService().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchNews,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<News> news = snapshot.data;

          return ListView.builder(
            itemCount: news.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var _trendingNews = news[index];

              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReadNews(
                        news: _trendingNews,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 300.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: PrimaryCard(
                    news: _trendingNews,
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
