import 'package:flutter/material.dart';
import 'package:moamo/features/guestbook/model/guestbook_entry.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class GuestbookCard extends StatelessWidget {
  const GuestbookCard({
    super.key,
    required this.entry,
    this.onEdit,
    this.onDelete,
  });

  final GuestbookEntry entry;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final mine = entry.isMine;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: mine ? AppColors.secondary100 : AppColors.neutral0,
        border: mine
            ? null
            : Border.all(color: AppColors.neutral15, width: 0.5),
        borderRadius: AppRadius.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          entry.name,
                          style: AppTextStyles.btn2Bold.copyWith(
                            color: mine
                                ? AppColors.neutral0
                                : AppColors.neutral90,
                          ),
                        ),
                        if (entry.isNew) ...[SizedBox(width: 6), _newBadge()],
                      ],
                    ),
                    Text(
                      entry.date,
                      style: AppTextStyles.caption1.copyWith(
                        color: AppColors.neutral40,
                      ),
                    ),
                  ],
                ),
              ),
              if (entry.canEdit || entry.canDelete) _menu(mine),
            ],
          ),
          SizedBox(height: 16),
          Text(
            entry.content,
            style: AppTextStyles.body1.copyWith(
              color: mine ? AppColors.neutral0 : AppColors.neutral90,
            ),
          ),
        ],
      ),
    );
  }

  Widget _newBadge() => Container(
    width: 16,
    height: 16,
    decoration: BoxDecoration(
      color: AppColors.notification,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Text(
        'N',
        style: AppTextStyles.caption2Bold.copyWith(
          color: AppColors.neutral0,
          fontSize: 8,
        ),
      ),
    ),
  );

  Widget _menu(bool mine) => PopupMenuButton<String>(
    padding: EdgeInsets.zero,
    color: AppColors.neutral05,
    shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
    onSelected: (value) =>
        value == 'delete' ? onDelete?.call() : onEdit?.call(),
    itemBuilder: (context) => [
      if (entry.canDelete) _menuItem('delete', '삭제', 'delete'),
      if (entry.canEdit) _menuItem('edit', '수정', 'write'),
    ],
    child: SvgIcon(
      name: 'kebab',
      size: AppIconSizes.md,
      color: mine ? AppColors.neutral0 : AppColors.neutral40,
    ),
  );

  PopupMenuItem<String> _menuItem(String value, String label, String icon) =>
      PopupMenuItem(
        value: value,
        child: Row(
          children: [
            SvgIcon(
              name: icon,
              size: AppIconSizes.md,
              color: AppColors.neutral90,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
            ),
          ],
        ),
      );
}
