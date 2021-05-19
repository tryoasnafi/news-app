import 'package:flutter/material.dart';
import 'package:news_app/services/api_service.dart';
import '../../models/news.dart';
import '../../widgets/secondary_card.dart';
import '../read_news_view.dart';

class RecentTabView extends StatefulWidget {
  @override
  _RecentTabViewState createState() => _RecentTabViewState();
}

class _RecentTabViewState extends State<RecentTabView> {
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
              var _recentNews = news[index];

              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReadNews(
                        news: _recentNews,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 135.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: SecondaryCard(
                    news: _recentNews,
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
