import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

/// 게시물 하단의 좋아요 / 댓글 / 스크랩 바.
class PostStatsBar extends StatelessWidget {
  const PostStatsBar({
    super.key,
    required this.likes,
    required this.isLiked,
    required this.comments,
    required this.isScrapped,
    required this.onLike,
    required this.onScrap,
  });

  final int likes, comments;
  final bool isLiked, isScrapped;
  final VoidCallback onLike, onScrap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.neutral05,
        borderRadius: AppRadius.md,
      ),
      child: Row(
        children: [
          _item(isLiked ? 'heart_active' : 'heart_none', '좋아요 $likes', onLike),
          _divider(),
          _item('comment', '댓글 $comments', null),
          _divider(),
          _item(
            isScrapped ? 'bookmark_active' : 'bookmark_none',
            '스크랩',
            onScrap,
          ),
        ],
      ),
    );
  }

  Widget _item(String icon, String label, VoidCallback? onTap) => Expanded(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgIcon(name: icon, size: AppIconSizes.md),
          SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.btn2.copyWith(color: AppColors.neutral40),
          ),
        ],
      ),
    ),
  );

  Widget _divider() =>
      Container(width: 0.5, height: 12, color: AppColors.neutral20);
}
