class GuestbookEntry {
  const GuestbookEntry({
    required this.name,
    required this.date,
    required this.content,
    this.isMine = false,
    this.isNew = false,
  });

  final String name, date, content;
  final bool isMine, isNew;
}
