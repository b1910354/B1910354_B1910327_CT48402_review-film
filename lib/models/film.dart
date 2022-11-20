
class Film {
  final String? id;
  final String name;
  final String title;
  final String writer;
  final String pubDate;
  final String lastDate;
  final String description;
  final String content;
  int isFavorite;
  final String imageUrl;
  final String type;

  // constructor - ham xay dung
  Film({
    this.id,
    required this.name,
    required this.title,
    required this.writer,
    required this.pubDate,
    required this.lastDate,
    required this.description,
    required this.content,
    this.isFavorite = 0,
    required this.imageUrl,
    required this.type,
  });

  // ghi de va tao ra mot product moi
  Film copyWith({
    String? id,
    String? name,
    String? title,
    String? pubDate,
    String? lastDate,
    String? writer,
    String? description,
    String? content,
    int? isFavorite,
    String? imageUrl,
    String? type,
  }) {
    return Film(
      // '??' - ifnull
      id: id ?? this.id,
      name: name?? this.name,
      title: title?? this.title,
      writer: writer ?? this.writer,
      pubDate: pubDate?? this.pubDate,
      lastDate: lastDate?? this.lastDate,
      description: description?? this.description,
      content: content?? this.content,
      isFavorite: isFavorite?? this.isFavorite,
      imageUrl: imageUrl?? this.imageUrl,
      type: type?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'writer': writer,
      'pubDate': pubDate,
      'lastDate': lastDate,
      'description': description,
      'content': content,
      'imageUrl': imageUrl,
      'type': type,
    };
  }

  static Film fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      writer: json['writer'],
      pubDate: json['pubDate'],
      lastDate: json['lastDate'],
      description: json['description'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      type: json['type'],
    );
  }
}