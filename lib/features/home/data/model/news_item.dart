import 'package:uuid/uuid.dart';
import 'package:x_projects_task/core/constants/assets_manager.dart';

class NewsItem {
  final String id, author, title, description, url, content, urlToImage;
  DateTime publishedAt;

  NewsItem({
    required this.id,
    required this.url,
    required this.title,
    required this.author,
    required this.content,
    required this.urlToImage,
    required this.description,
    required this.publishedAt,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: const Uuid().v4(),
      url: json['url'] ?? "https://flutter.dev",
      author: json['author'] ?? "unknown author",
      title: json['title'] ?? "no title available",
      content: json['content'] ?? "no content available",
      description: json['description'] ?? "no description available",
      publishedAt: DateTime.tryParse(json['publishedAt']) ?? DateTime.now(),
      urlToImage: json['urlToImage'] ?? AssetsManager.assetsImagesNewsDummy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'title': title,
      'author': author,
      'content': content,
      'urlToImage': urlToImage,
      'description': description,
      'publishedAt': publishedAt,
    };
  }

  @override
  String toString() {
    return 'NewsItem{id: $id, url: $url, title: $title, author: $author, content: $content, urlToImage: $urlToImage, description: $description, publishedAt: $publishedAt}';
  }
}
