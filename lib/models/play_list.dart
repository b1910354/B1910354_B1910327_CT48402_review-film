class PlayList {
  final String id;
  final String name;
  final String imageUrl;

  PlayList({
    required this.id,
    required this.name,
    required this.imageUrl
  });

  PlayList copyWith({
    String? id,
    String? name,
    String? imageUrl
  }) {
    return PlayList(
      id: id ?? this.id,
      name: name?? this.name,
      imageUrl: imageUrl?? this.imageUrl
    );
  }
}