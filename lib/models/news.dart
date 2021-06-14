import 'dart:math';

class News {
  final String author;
  final String category;
  final String content;
  final String estimate;
  final String favorite;
  final String image;
  final String seen;
  final String subtitle;
  final String time;
  final String title;

  News({
    this.author,
    this.category,
    this.content,
    this.estimate,
    this.favorite,
    this.image,
    this.seen,
    this.subtitle,
    this.time,
    this.title,
  });

  static int countReadingTime(content) {
    if (content != null) {
      final int _numberOfWords = new RegExp(r"\s").allMatches(content).length;
      final int _readTime = (_numberOfWords / 250).ceil();
      return _readTime;
    }
    return 0;
  }

  static String publishedAt(String time) {
    DateTime publishedTime = DateTime.tryParse(time);
    DateTime currentTime = DateTime.now();

    int publishedTimestamp = publishedTime.millisecondsSinceEpoch;
    int currentTimestamp = currentTime.millisecondsSinceEpoch;

    int secondSincePublished = (currentTimestamp - publishedTimestamp) ~/ 1000;

    String publishedAt = "";

    if (secondSincePublished >= 86400) {
      var daySincePublished = secondSincePublished ~/ 86400;
      publishedAt = "$daySincePublished hari lalu";
    } else if (secondSincePublished >= 3600) {
      var hourSincePublished = secondSincePublished ~/ 3600;
      publishedAt = "$hourSincePublished jam lalu";
    } else if (secondSincePublished >= 60) {
      var minuteSincePublished = secondSincePublished ~/ 60;
      publishedAt = "$minuteSincePublished menit lalu";
    } else {
      publishedAt = "1 menit lalu";
    }

    return publishedAt;
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      subtitle: json['description'] ?? "",
      image: json['urlToImage'] ?? "",
      content: json['content'] ?? "",
      time: publishedAt(json['publishedAt']) ?? "",
      category: 'RANDOM',
      estimate: countReadingTime(json['content']).toString(),
      favorite: (Random().nextDouble() + Random().nextInt(15) + 1)
              .toStringAsFixed(1) +
          'k',
      seen: (Random().nextInt(100) + 1).toString() + 'k',
    );
  }
}
// popularList
// trendingList
// recentList
