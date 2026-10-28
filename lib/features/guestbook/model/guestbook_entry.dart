class GuestbookEntry {
  const GuestbookEntry({
    required this.name,
    required this.date,
    required this.content,
    this.isMine = false,
    this.isNew = false,
    this.canEdit = false,
    this.canDelete = false,
  });

  final String name, date, content;

  /// 주인 말풍선 색으로 그릴지 (서버 `ownerEntry`).
  final bool isMine;
  final bool isNew, canEdit, canDelete;
}
