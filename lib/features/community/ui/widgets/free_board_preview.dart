import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/community/model/community_post.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'post_category_label.dart';
import 'reaction_counts.dart';
import 'section_title.dart';

class FreeBoardPreview extends StatelessWidget {
  const FreeBoardPreview({super.key, required this.posts});

  final List<CommunityPost> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          '자유게시판',
          trailing: GestureDetector(
            onTap: () => context.push('/community/free'),
            child: Row(
              children: [
                Text(
                  '전체 보기',
                  style: AppTextStyles.body1.copyWith(color: AppColors.neutral),
                ),
                SvgIcon(name: 'next', size: AppIconSizes.sm),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        for (var i = 0; i < posts.length; i++) ...[
          if (i > 0) SizedBox(height: 20),
          Row(
            children: [
              PostCategoryLabel(posts[i].category),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  posts[i].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body1Bold.copyWith(
                    color: AppColors.neutral90,
                  ),
                ),
              ),
              ReactionCounts(
                likes: posts[i].likes,
                comments: posts[i].comments,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
