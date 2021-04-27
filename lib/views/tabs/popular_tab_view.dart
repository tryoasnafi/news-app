import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import '../../models/news.dart';
import '../../widgets/primary_card.dart';
import '../../widgets/secondary_card.dart';

class PopularTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: const EdgeInsets.only(left: 18.0),
            child: ListView.builder(
              itemCount: popularList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var _popularNews = popularList[index];
                return InkWell(
                  onTap: () {},
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
          ListView.builder(
            itemCount: recentList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              var _recentNews = recentList[index];
              return InkWell(
                onTap: () {},
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
          )
        ],
      ),
    );
  }
}
