import 'package:flutter/material.dart';
import '../../models/news.dart';
import '../../widgets/secondary_card.dart';
import '../read_news_view.dart';

class RecentTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recentList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var _recentNews = recentList[index];

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
  }
}
