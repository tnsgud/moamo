import 'package:flutter/material.dart';
import 'package:moamo/features/community/model/post_comment.dart';
import 'package:moamo/features/guestbook/ui/widgets/guestbook_avatar.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

/// 댓글 한 건과 그 아래 대댓글 목록.
class CommentTile extends StatefulWidget {
  const CommentTile({super.key, required this.comment, this.isReply = false});

  final PostComment comment;
  final bool isReply;

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  late bool _liked = widget.comment.isLiked;
  late int _likes = widget.comment.likes;

  void _toggleLike() => setState(() {
    _liked = !_liked;
    _likes += _liked ? 1 : -1;
  });

  @override
  Widget build(BuildContext context) {
    final comment = widget.comment;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GuestbookAvatar(),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.author,
                    style: AppTextStyles.btn2Bold.copyWith(
                      color: AppColors.neutral90,
                    ),
                  ),
                  Text(
                    comment.date,
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.neutral40,
                    ),
                  ),
                ],
              ),
            ),
            SvgIcon(
              name: 'kebab',
              size: AppIconSizes.md,
              color: AppColors.neutral40,
            ),
          ],
        ),
        SizedBox(height: 12),
        Text(
          comment.content,
          style: AppTextStyles.body1.copyWith(color: AppColors.neutral90),
        ),
        if (comment.hasSticker) ...[
          SizedBox(height: 8),
          // TODO: 이모티콘 이미지로 교체
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.profile,
              shape: BoxShape.circle,
            ),
          ),
        ],
        SizedBox(height: 12),
        Row(
          children: [
            GestureDetector(
              onTap: _toggleLike,
              child: _action(
                _liked ? 'heart_active' : 'heart_none',
                _likes > 0 ? '좋아요 $_likes' : '좋아요',
              ),
            ),
            SizedBox(width: 12),
            _action('comment', '댓글 달기'),
          ],
        ),
        for (final reply in comment.replies) ...[
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '└',
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.neutral20,
                  ),
                ),
                SizedBox(width: 4),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.neutral05,
                      borderRadius: AppRadius.xl,
                    ),
                    child: CommentTile(comment: reply, isReply: true),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _action(String icon, String label) => Row(
    children: [
      SvgIcon(name: icon, size: AppIconSizes.md),
      SizedBox(width: 2),
      Text(
        label,
        style: AppTextStyles.caption1.copyWith(color: AppColors.neutral40),
      ),
    ],
  );
}
