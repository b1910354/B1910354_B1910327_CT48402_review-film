// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comment {
  final String? id;
  final String? filmId;
  final String comment;

  Comment({
    this.id,
    this.filmId,
    required this.comment,
  });
  

  Comment copyWith({
    String? id,
    String? filmId,
    String? comment,
  }) {
    return Comment(
      id: id ?? this.id,
      filmId: filmId ?? this.filmId,
      comment: comment ?? this.comment,
    );
  }
  

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'filmId': filmId,
      'comment': comment,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      filmId: json['filmId'],
      comment: json['comment'],
    );
  }

}
