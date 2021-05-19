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
    final String _content = content;
    final int _numberOfWords = new RegExp(r"\s").allMatches(_content).length;
    final int _readTime = (_numberOfWords / 250).ceil();
    return _readTime;
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] as String,
      title: json['title'] as String,
      subtitle: json['description'] as String,
      image: json['urlToImage'] as String,
      content: json['content'] as String,
      time: json['publishedAt'] as String,
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
