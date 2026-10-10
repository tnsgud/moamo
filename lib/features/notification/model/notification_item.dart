class NotificationItem {
  const NotificationItem({
    required this.category,
    required this.message,
    required this.time,
    this.isRead = false,
  });

  final String category, message, time;
  final bool isRead;
}
