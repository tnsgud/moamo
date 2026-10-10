import 'package:flutter/material.dart';
import 'package:moamo/features/community/model/community_post.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

import 'reaction_counts.dart';

/// 가로 스크롤 인기 게시물 목록. [bookTitle]이 있으면 표지와 책 제목을 함께 보여준다.
class PopularPostList extends StatelessWidget {
  const PopularPostList({super.key, required this.posts, this.bookTitle});

  final List<CommunityPost> posts;
  final String? bookTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // 오른쪽 화면 끝까지 카드가 보이도록 부모 패딩 밖까지 그린다.
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (var i = 0; i < posts.length; i++) ...[
            if (i > 0) SizedBox(width: 12),
            _Card(post: posts[i], bookTitle: bookTitle),
          ],
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.post, this.bookTitle});

  final CommunityPost post;
  final String? bookTitle;

  @override
  Widget build(BuildContext context) {
    final hasBook = bookTitle != null;

    return Container(
      width: 336,
      padding: EdgeInsets.all(hasBook ? 20 : 16),
      decoration: BoxDecoration(
        color: AppColors.neutral05,
        borderRadius: AppRadius.xl,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasBook) ...[
            // TODO: 책 표지 이미지로 교체
            Container(
              width: 68,
              height: 83,
              decoration: BoxDecoration(
                color: AppColors.neutral50,
                borderRadius: AppRadius.xxs,
              ),
            ),
            SizedBox(width: 12),
          ],
          Expanded(
            child: SizedBox(
              height: hasBook ? 83 : 68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (hasBook)
                        Text(
                          bookTitle!,
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.neutral70,
                          ),
                        )
                      else
                        Expanded(child: _title()),
                      Text(
                        post.date,
                        style: AppTextStyles.caption1.copyWith(
                          color: AppColors.neutral50,
                        ),
                      ),
                    ],
                  ),
                  if (hasBook) ...[SizedBox(height: 4), _title()],
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        post.author,
                        style: AppTextStyles.caption1.copyWith(
                          color: AppColors.neutral50,
                        ),
                      ),
                      ReactionCounts(
                        likes: post.likes,
                        comments: post.comments,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() => Text(
    post.title,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: AppTextStyles.btn2Bold.copyWith(color: AppColors.neutral90),
  );
}
