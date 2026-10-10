class CommunityPost {
  const CommunityPost({
    required this.title,
    required this.content,
    required this.category,
    required this.author,
    required this.date,
    this.likes = 0,
    this.comments = 0,
  });

  final String title, content, category, author, date;
  final int likes, comments;
}
