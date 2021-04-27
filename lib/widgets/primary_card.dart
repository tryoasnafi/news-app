import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/news.dart';

class PrimaryCard extends StatelessWidget {
  final News news;

  PrimaryCard({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: kGrey3,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5.0,
                backgroundColor: kGrey1,
              ),
              SizedBox(width: 10.0),
              Text(
                news.category,
                style: kCategoryTitle,
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Expanded(
            child: Hero(
              tag: news.seen,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(news.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            news.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: kTitleCard,
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                news.time,
                style: kDetailContent,
              ),
              SizedBox(width: 8.0),
              CircleAvatar(
                radius: 2.0,
                backgroundColor: kGrey1,
              ),
              SizedBox(width: 8.0),
              Text(
                "${news.estimate} min read",
                style: kDetailContent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
