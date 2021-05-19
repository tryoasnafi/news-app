import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/services/api_service.dart';
import '../../views/read_news_view.dart';
import '../../models/news.dart';
import '../../widgets/primary_card.dart';
import '../../widgets/secondary_card.dart';

class PopularTabView extends StatefulWidget {
  @override
  _PopularTabViewState createState() => _PopularTabViewState();
}

class _PopularTabViewState extends State<PopularTabView> {
  // ApiService client = ApiService();
  Future<List<News>> fetchNews;

  @override
  void initState() {
    super.initState();
    fetchNews = ApiService().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: const EdgeInsets.only(left: 18.0),
            child: FutureBuilder(
              future: fetchNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<News> news = snapshot.data;

                  return ListView.builder(
                    itemCount: news.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var _popularNews = news[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ReadNews(
                                news: _popularNews,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 12.0,
                          ),
                          child: PrimaryCard(
                            news: _popularNews,
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(("${snapshot.error}"));
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          SizedBox(height: 25.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text(
                "BASSED ON YOUR READING HISTORY",
                style: kNonActiveTabStyle,
              ),
            ),
          ),
          FutureBuilder(
            future: fetchNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<News> news = snapshot.data;

                return ListView.builder(
                  itemCount: news.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
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
                return Text(("${snapshot.error}"));
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
