import 'package:flutter/material.dart';
import 'package:moamo/shared/api/export.dart';
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

  final BookMemoResponse memo;

  /// 작성일을 `yy/MM/dd`로 (로컬 시간).
  String get _date {
    final d = memo.createdAt.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.year % 100)}/${two(d.month)}/${two(d.day)}';
  }

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
                _date,
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
          if (memo.content != null) ...[
            SizedBox(height: 12),
            Text(
              memo.content!,
              style: AppTextStyles.body1.copyWith(color: AppColors.neutral90),
            ),
          ],
          if (memo.imageUrl != null) ...[
            SizedBox(height: 12),
            // TODO: imageUrl은 JWT가 필요해서 Bearer 헤더로 받아 그려야 한다
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
