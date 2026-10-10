import 'package:flutter/material.dart';
import 'package:moamo/features/community/model/community_post.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/search_field.dart';

import 'widgets/book_cover_list.dart';
import 'widgets/community_tab_header.dart';
import 'widgets/free_board_preview.dart';
import 'widgets/genre_community_grid.dart';
import 'widgets/monthly_library_list.dart';
import 'widgets/popular_post_list.dart';
import 'widgets/section_title.dart';

class CommunityMainScreen extends StatefulWidget {
  const CommunityMainScreen({super.key});

  @override
  State<CommunityMainScreen> createState() => _CommunityMainScreenState();
}

class _CommunityMainScreenState extends State<CommunityMainScreen> {
  static const _tabs = ['커뮤니티', '모임/북콘서트'];
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
  static const _bookTitles = [
    '해리포터와 마법사의 돌',
    '잘했고 잘하고 있고 잘될 것이다...',
    '나의 완벽한 장례식',
    '워런 버핏 평전(2026)',
  ];
  static const _freePosts = [
    CommunityPost(
      title: '방명록 남기고 가세요 XD',
      content: '',
      category: '서재 자랑',
      author: '',
      date: '',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '이 책 찾아주세요 바나나 100',
      content: '',
      category: '책 찾아주세요',
      author: '',
      date: '',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '솔직히 해리포터보다는 볼드모트가 더 재밌지 않나요',
      content: '',
      category: '자유게시판',
      author: '',
      date: '',
      likes: 73,
      comments: 2,
    ),
  ];

  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommunityTabHeader(
          tabs: _tabs,
          selected: _tab,
          onSelected: (i) => setState(() => _tab = i),
        ),
        SizedBox(height: 8),
        SearchField(hintText: '책 정보로 커뮤니티를 찾아보세요.', onSubmitted: (value) {}),
        Expanded(
          child: _tab == 0
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      SectionTitle('실시간 인기 게시물'),
                      SizedBox(height: 12),
                      PopularPostList(
                        posts: _popularPosts,
                        bookTitle: '해리포터와 마법사의 돌',
                      ),
                      SizedBox(height: 32),
                      BookCoverList(title: 'HOT 책 커뮤니티', titles: _bookTitles),
                      SizedBox(height: 32),
                      BookCoverList(
                        title: 'X세대가 MZ에게 추천하는 책',
                        titles: _bookTitles,
                      ),
                      SizedBox(height: 32),
                      GenreCommunityGrid(
                        genres: ['자기계발서', '경제·경영서', '소설', '에세이'],
                      ),
                      SizedBox(height: 32),
                      FreeBoardPreview(posts: _freePosts),
                      SizedBox(height: 32),
                      MonthlyLibraryList(
                        owners: ['규호', '규호', '규호', '규호', '규호'],
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                )
              : Center(
                  child: Text(
                    '준비 중이에요.',
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.neutral50,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
