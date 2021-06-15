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
    // Default: 1 min
    return 1;
  }

  static String publishedAt(String time) {
    DateTime publishedTime = DateTime.tryParse(time);
    DateTime currentTime = DateTime.now();

    int publishedTimestamp = publishedTime.millisecondsSinceEpoch;
    int currentTimestamp = currentTime.millisecondsSinceEpoch;

    int secondSincePublished = (currentTimestamp - publishedTimestamp) ~/ 1000;
    int interval = 0;

    if (secondSincePublished >= 31536000) {
      interval = secondSincePublished ~/ 31536000;
      return (interval == 1) ? "1 year ago" : "$interval years ago";
    } else if (secondSincePublished >= 2592000) {
      interval = secondSincePublished ~/ 2592000;
      return (interval == 1) ? "1 month ago" : "$interval months ago";
    } else if (secondSincePublished >= 86400) {
      interval = secondSincePublished ~/ 86400;
      return (interval == 1) ? "1 day ago" : "$interval days ago";
    } else if (secondSincePublished >= 3600) {
      interval = secondSincePublished ~/ 3600;
      return (interval == 1) ? "1 hour ago" : "$interval hours ago";
    } else if (secondSincePublished >= 60) {
      interval = secondSincePublished ~/ 60;
      return (interval == 1) ? "1 minute ago" : "$interval minutes ago";
    }

    return "1 minute ago";
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      subtitle: json['description'] ?? "",
      image: json['urlToImage'] ?? "",
      content: json['content'] ?? "",
      time: publishedAt(json['publishedAt']) ?? "",
      category: json['source']['name'] ?? "",
      estimate: countReadingTime(json['content']).toString(),
      favorite:
          "${(Random().nextDouble() + Random().nextInt(15) + 1).toStringAsFixed(1)} k",
      seen: (Random().nextInt(100) + 1).toString() + 'k',
    );
  }
}
// popularList
// trendingList
// recentList
