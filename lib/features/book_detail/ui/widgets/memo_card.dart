import 'package:flutter/material.dart';
import 'package:moamo/features/book_detail/model/book_memo.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class MemoCard extends StatelessWidget {
  const MemoCard({
    super.key,
    required this.memo,
    required this.onEdit,
    required this.onDelete,
  });

  final BookMemo memo;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.neutral05,
        borderRadius: AppRadius.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                memo.date,
                style: AppTextStyles.h3.copyWith(color: AppColors.neutral40),
              ),
              Spacer(),
              GestureDetector(
                onTap: onEdit,
                child: SvgIcon(name: 'write', size: AppIconSizes.lg),
              ),
              SizedBox(width: 12),
              GestureDetector(
                onTap: onDelete,
                child: SvgIcon(name: 'delete', size: AppIconSizes.lg),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            memo.content,
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral90),
          ),
          if (memo.hasImage) ...[
            SizedBox(height: 12),
            // TODO: 메모 이미지가 준비되면 교체
            Container(
              width: 125,
              height: 116,
              decoration: BoxDecoration(
                color: AppColors.neutral50,
                borderRadius: AppRadius.xs,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
