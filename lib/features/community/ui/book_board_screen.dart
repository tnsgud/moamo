import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/community/model/community_post.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/popular_post_list.dart';
import 'widgets/post_category_label.dart';
import 'widgets/post_list_item.dart';
import 'widgets/section_title.dart';

class BookBoardScreen extends StatelessWidget {
  const BookBoardScreen({super.key, required this.bookId});

  final int bookId;

  // TODO: 서버 데이터로 교체
  static const _popularPosts = [
    CommunityPost(
      title: '아무리 사촌이라도 좀 너무한 듯',
      content: '',
      category: '책 후기',
      author: '강팔순',
      date: '26/08/23',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '아무리 사촌이라도 좀 너무한 듯',
      content: '',
      category: '책 후기',
      author: '강팔순',
      date: '26/08/23',
      likes: 73,
      comments: 2,
    ),
  ];
  static const _posts = [
    CommunityPost(
      title: '아무리 사촌이라도 너무한듯',
      content: '아니 아무리 해리가 지들 다락방에 얹혀산다고 해도 너무 함부로 굴지 않음?\n해리 너무 불쌍해ㅠ',
      category: '책 후기',
      author: '강팔순',
      date: '1시간 전',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '이거 오타인가요?',
      content: '여기 이상한 단어가 적혀있는데 이거 출판사에 신고하면 돈 받나요',
      category: '질문',
      author: '강팔순',
      date: '1시간 전',
      likes: 73,
      comments: 2,
    ),
  ];

  Future<void> _write(BuildContext context) async {
    final posted = await context.push<bool>('/community/book/$bookId/write');
    if (posted == true && context.mounted) {
      showAppToast(context, '게시물이 작성되었습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: SvgIcon(name: 'back', size: AppIconSizes.lg),
          ),
          title: Text(
            '게시판',
            style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
          ),
          actions: [
            GestureDetector(
              onTap: () => _write(context),
              child: SvgIcon(name: 'write', size: AppIconSizes.lg),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bookCard(),
                SizedBox(height: 12),
                SearchField(
                  hintText: '책의 궁금한 내용을 검색해 보세요.',
                  onSubmitted: (value) {},
                ),
                SizedBox(height: 24),
                SectionTitle('인기 게시물'),
                SizedBox(height: 12),
                PopularPostList(posts: _popularPosts),
                SizedBox(height: 32),
                SectionTitle(
                  '커뮤니티 게시물',
                  trailing: Row(
                    children: [
                      SvgIcon(name: 'sorting', size: AppIconSizes.sm),
                      SizedBox(width: 6),
                      Text(
                        '최신순',
                        style: AppTextStyles.btn2.copyWith(
                          color: AppColors.neutral60,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                for (var i = 0; i < _posts.length; i++) ...[
                  if (i > 0)
                    Divider(
                      height: 0.5,
                      thickness: 0.5,
                      color: AppColors.neutral15,
                    ),
                  PostListItem(post: _posts[i]),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bookCard() => Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.neutral15, width: 0.5),
      borderRadius: AppRadius.xl,
    ),
    child: Row(
      children: [
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostCategoryLabel('소설'),
            SizedBox(height: 12),
            Text(
              '해리포터와 마법사의 돌',
              style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
            ),
            SizedBox(height: 4),
            Text(
              '조앤 K.롤링',
              style: AppTextStyles.caption1.copyWith(
                color: AppColors.neutral50,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
