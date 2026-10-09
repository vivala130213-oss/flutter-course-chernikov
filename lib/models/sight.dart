class Sight {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  bool isLiked;
  int likeCount;

  Sight({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isLiked = false,
    required this.likeCount,
  });
}