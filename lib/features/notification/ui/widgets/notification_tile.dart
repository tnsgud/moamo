import 'package:flutter/material.dart';
import 'package:moamo/features/notification/model/notification_item.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.item});

  final NotificationItem item;

  @override
  Widget build(BuildContext context) {
    final read = item.isRead;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgIcon(
          name: 'community_${read ? 'none' : 'active'}',
          size: AppIconSizes.md,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.category,
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.neutral50,
                ),
              ),
              SizedBox(height: 4),
              Text(
                item.message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body1.copyWith(
                  color: read ? AppColors.neutral40 : AppColors.neutral90,
                ),
              ),
              SizedBox(height: 4),
              Text(
                item.time,
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.neutral40,
                ),
              ),
            ],
          ),
        ),
        if (!read)
          Container(
            width: 7,
            height: 7,
            margin: EdgeInsets.only(top: 6, right: 12),
            decoration: BoxDecoration(
              color: AppColors.notification,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
