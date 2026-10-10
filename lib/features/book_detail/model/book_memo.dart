class BookMemo {
  const BookMemo({
    required this.date,
    required this.content,
    this.hasImage = false,
  });

  final String date, content;
  final bool hasImage;
}
