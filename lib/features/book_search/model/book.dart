class Book {
  const Book({
    required this.title,
    required this.author,
    required this.category,
    required this.imageUrl,
    required this.isCertification,
  });

  final String title, author, category, imageUrl;
  final bool isCertification;
}
