import 'package:flutter/material.dart';
import 'package:moamo/features/community/model/community_post.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

import 'post_category_label.dart';
import 'reaction_counts.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});

  final CommunityPost post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PostCategoryLabel(post.category),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  post.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.neutral90,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            post.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body2.copyWith(color: AppColors.neutral70),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                post.author,
                style: AppTextStyles.body2.copyWith(color: AppColors.neutral50),
              ),
              Row(
                children: [
                  ReactionCounts(likes: post.likes, comments: post.comments),
                  SizedBox(width: 8),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.neutral20,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    post.date,
                    style: AppTextStyles.caption2.copyWith(
                      color: AppColors.neutral40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
