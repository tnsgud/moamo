import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

/// 이전 / 다음 게시물로 이동하는 카드.
class PostNavigatorCard extends StatelessWidget {
  const PostNavigatorCard({
    super.key,
    required this.previousTitle,
    required this.nextTitle,
    this.onPrevious,
    this.onNext,
  });

  final String previousTitle, nextTitle;
  final VoidCallback? onPrevious, onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.neutral05,
        borderRadius: AppRadius.xl,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onPrevious,
              child: Row(
                children: [
                  SvgIcon(name: 'back', size: AppIconSizes.md),
                  SizedBox(width: 8),
                  Expanded(
                    child: _label(
                      '이전 게시물',
                      previousTitle,
                      CrossAxisAlignment.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onNext,
              child: Row(
                children: [
                  Expanded(
                    child: _label('다음 게시물', nextTitle, CrossAxisAlignment.end),
                  ),
                  SizedBox(width: 8),
                  SvgIcon(name: 'next', size: AppIconSizes.md),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String caption, String title, CrossAxisAlignment align) =>
      Column(
        crossAxisAlignment: align,
        children: [
          Text(
            caption,
            style: AppTextStyles.body2.copyWith(color: AppColors.neutral40),
          ),
          SizedBox(height: 4),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: align == CrossAxisAlignment.end
                ? TextAlign.end
                : TextAlign.start,
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral50),
          ),
        ],
      );
}
