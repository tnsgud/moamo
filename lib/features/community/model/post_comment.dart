class PostComment {
  const PostComment({
    required this.author,
    required this.date,
    required this.content,
    this.likes = 0,
    this.isLiked = false,
    this.hasSticker = false,
    this.replies = const [],
  });

  final String author, date, content;
  final int likes;
  final bool isLiked, hasSticker;
  final List<PostComment> replies;
}
