import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/widgets/circle_button.dart';
import '../models/news.dart';

class ReadNews extends StatelessWidget {
  final News news;
  const ReadNews({this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios_rounded,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {},
                  ),
                  CircleButton(
                    icon: Icons.favorite_border,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(70.0),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(height: 12.0),
              Hero(
                tag: news.seen,
                child: Container(
                  height: 220.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(news.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kGrey1,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(news.category),
                  ),
                  Spacer(),
                  Status(
                    icon: Icons.remove_red_eye,
                    total: news.seen,
                  ),
                  SizedBox(width: 16.0),
                  Status(
                    icon: Icons.favorite_border,
                    total: news.favorite,
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Text(
                news.title,
                style: kTitleCard.copyWith(fontSize: 24.0),
              ),
              SizedBox(height: 12.0),
              Row(
                children: [
                  Text(
                    news.time,
                    style: kDetailContent,
                  ),
                  SizedBox(width: 5.0),
                  SizedBox(
                    width: 10.0,
                    child: Divider(
                      color: kBlack,
                      height: 2.0,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    news.author,
                    style: kDetailContent,
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                news.content,
                style: kDetailContent.copyWith(
                  fontSize: 16.0,
                  color: kBlack,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final IconData icon;
  final String total;

  const Status({this.icon, this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: kGrey2,
        ),
        SizedBox(width: 4.0),
        Text(
          total,
          style: kDetailContent,
        ),
      ],
    );
  }
}
