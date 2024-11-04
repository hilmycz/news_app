// national_news_model.dart

class NationalNewsModel {
  final String? link;
  final String? image;
  final String? description;
  final String? title;
  final List<Post>? posts;

  NationalNewsModel({
    this.link,
    this.image,
    this.description,
    this.title,
    this.posts,
  });

  factory NationalNewsModel.fromJson(Map<String, dynamic> json) => NationalNewsModel(
        link: json["link"],
        image: json["image"],
        description: json["description"],
        title: json["title"],
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );
}

class Post {
  final String? link;
  final String? title;
  final DateTime? pubDate;
  final String? description;
  final String? thumbnail;

  Post({
    this.link,
    this.title,
    this.pubDate,
    this.description,
    this.thumbnail,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        link: json["link"],
        title: json["title"],
        pubDate: json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
        description: json["description"],
        thumbnail: json["thumbnail"],
      );
}
