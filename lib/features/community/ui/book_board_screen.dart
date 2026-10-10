import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/ui/widgets/app_chip_list.dart';
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
import 'widgets/sort_menu_button.dart';

class BookBoardScreen extends StatefulWidget {
  const BookBoardScreen({super.key, required this.bookId});

  final int bookId;

  @override
  State<BookBoardScreen> createState() => _BookBoardScreenState();
}

class _BookBoardScreenState extends State<BookBoardScreen> {
  static const _categories = ['전체', '책 후기', '질문', '의견토론'];
  static const _sorts = ['최신순', '오래된 순', '인기순'];

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
  static const List<CommunityPost> _allPosts = [
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
      author: '피우피우',
      date: '1시간 전',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '해리포터 세계관에서 마법사라면...',
      content: '어떨 것 같나요? 저는 호그와트 방학 때 나갔다가 바로 들킬 듯 ㅎ',
      category: '의견토론',
      author: '강팔순',
      date: '2시간 전',
      likes: 12,
      comments: 5,
    ),
  ];

  final _search = TextEditingController();
  String _query = '';
  int _category = 0;
  int _sort = 0;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  bool get _isSearching => _query.isNotEmpty || _category != 0;

  List<CommunityPost> get _results {
    final list = _allPosts.where((post) {
      if (_category != 0 && post.category != _categories[_category]) {
        return false;
      }
      if (_query.isEmpty) return true;
      if (_query.startsWith('#')) return post.category == _query.substring(1);
      return post.title.contains(_query) || post.content.contains(_query);
    }).toList();

    return switch (_sort) {
      1 => list.reversed.toList(),
      2 => list..sort((a, b) => b.likes.compareTo(a.likes)),
      _ => list,
    };
  }

  void _selectCategory(int index) {
    setState(() {
      _category = index;
      // 카테고리 칩은 검색창에 해시태그로 반영한다.
      if (index != 0) {
        _search.text = '#${_categories[index]}';
        _query = _search.text;
      } else if (_query.startsWith('#')) {
        _search.clear();
        _query = '';
      }
    });
  }

  Future<void> _write() async {
    final posted = await context.push<bool>(
      '/community/book/${widget.bookId}/write',
    );
    if (posted == true && mounted) {
      showAppToast(context, '게시물이 작성되었습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;

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
              onTap: _write,
              child: SvgIcon(name: 'write', size: AppIconSizes.lg),
            ),
          ],
        ),
        _bookCard(),
        SizedBox(height: 12),
        SearchField(
          controller: _search,
          hintText: '책의 궁금한 내용을 검색해 보세요.',
          onSubmitted: (value) => setState(() => _query = value.trim()),
        ),
        Expanded(
          child: _allPosts.isEmpty
              ? _emptyBoard()
              : _isSearching && results.isEmpty
              ? _emptySearch()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_isSearching)
                        _searchHeader(results.length)
                      else ...[
                        SizedBox(height: 24),
                        SectionTitle('인기 게시물'),
                        SizedBox(height: 12),
                        PopularPostList(posts: _popularPosts),
                        SizedBox(height: 32),
                      ],
                      SectionTitle(
                        '커뮤니티 게시물',
                        trailing: SortMenuButton(
                          options: _sorts,
                          selected: _sort,
                          onSelected: (i) => setState(() => _sort = i),
                        ),
                      ),
                      SizedBox(height: 4),
                      for (var i = 0; i < results.length; i++) ...[
                        if (i > 0)
                          Divider(
                            height: 0.5,
                            thickness: 0.5,
                            color: AppColors.neutral15,
                          ),
                        PostListItem(post: results[i]),
                      ],
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  Widget _searchHeader(int count) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 12),
      Text(
        '검색 결과: $count건',
        style: AppTextStyles.caption1.copyWith(color: AppColors.neutral50),
      ),
      SizedBox(height: 12),
      AppChipList(
        data: _categories,
        selectedIndex: _category,
        onSelected: _selectCategory,
      ),
      SizedBox(height: 24),
    ],
  );

  Widget _emptySearch() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/no_search_data.png',
          width: 160,
          height: 160,
        ),
        SizedBox(height: 24),
        Text(
          '찾으시는 키워드의 결과가 없어요',
          style: AppTextStyles.subtitle.copyWith(color: AppColors.secondary100),
        ),
        SizedBox(height: 8),
        Text(
          '다른 키워드로 검색하거나\n새로운 게시물을 작성해보세요',
          textAlign: TextAlign.center,
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral40),
        ),
      ],
    ),
  );

  Widget _emptyBoard() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '아직 커뮤니티에 작성된 게시물이 없어요',
        style: AppTextStyles.subtitle.copyWith(color: AppColors.secondary100),
      ),
      SizedBox(height: 4),
      Text(
        '누구보다 먼저 새로운 게시물을 작성해보세요!',
        style: AppTextStyles.caption1.copyWith(color: AppColors.neutral40),
      ),
      SizedBox(height: 24),
      GestureDetector(
        onTap: _write,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: AppRadius.round,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgIcon(name: 'write', size: AppIconSizes.md),
              SizedBox(width: 8),
              Text(
                '게시물 작성하기',
                style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
              ),
            ],
          ),
        ),
      ),
    ],
  );

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
