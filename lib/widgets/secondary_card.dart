import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import '../models/news.dart';

class SecondaryCard extends StatelessWidget {
  final News news;
  SecondaryCard({this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: kGrey3, width: 1.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: FadeInImage(
              placeholder: AssetImage('assets/default-image-placeholder.png'),
              image: (news.image != "")
                  ? NetworkImage(news.image)
                  : AssetImage('assets/default-image-placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8.0,
              ),
              child: Column(
                children: [
                  Text(
                    news.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kTitleCard,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    news.subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kDetailContent,
                  ),
                  Spacer(),
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
                      Text("${news.estimate} min read"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
