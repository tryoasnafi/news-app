import 'package:flutter/material.dart';
import '../../models/news.dart';
import '../../widgets/primary_card.dart';

class TrendingTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trendingList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var _trendingNews = trendingList[index];

        return InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 300.0,
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: PrimaryCard(news: _trendingNews),
          ),
        );
      },
    );
  }
}
