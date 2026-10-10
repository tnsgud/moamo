import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/ui/widgets/app_chip_list.dart';
import 'package:moamo/features/community/model/community_post.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/popular_post_list.dart';
import 'widgets/post_list_item.dart';
import 'widgets/recent_search_panel.dart';
import 'widgets/section_title.dart';
import 'widgets/sort_menu_button.dart';

class FreeBoardScreen extends StatefulWidget {
  const FreeBoardScreen({super.key});

  @override
  State<FreeBoardScreen> createState() => _FreeBoardScreenState();
}

class _FreeBoardScreenState extends State<FreeBoardScreen> {
  static const _categories = ['전체', '끄적끄적', '책 찾아주세요', '서재 자랑'];
  static const _sorts = ['최신순', '오래된 순', '인기순'];

  // TODO: 서버 데이터로 교체
  static const _popularPosts = [
    CommunityPost(
      title: '아무리 사촌이라도 좀 너무한 듯',
      content: '',
      category: '끄적끄적',
      author: '강팔순',
      date: '26/08/23',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '아무리 사촌이라도 좀 너무한 듯',
      content: '',
      category: '끄적끄적',
      author: '강팔순',
      date: '26/08/23',
      likes: 73,
      comments: 2,
    ),
  ];
  static const _allPosts = [
    CommunityPost(
      title: '여름에 읽으면 좋을 무서운 책 추천~',
      content: '아니 아무리 해리가 지들 다락방에 얹혀산다고 해도 너무 함부로 굴지 않음?\n해리 너무 불쌍해ㅠ',
      category: '끄적끄적',
      author: '강팔순',
      date: '1시간 전',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '이 내용 아시나요?',
      content: '여기 이상한 단어가 적혀있는데 이거 출판사에 신고하면 돈 받나요',
      category: '책 찾아주세요',
      author: '피우피우',
      date: '1시간 전',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '벌써 50권 읽었어요!',
      content: '어떨 것 같나요? 저는 호그와트 방학 때 나갔다가 바로 들킬 듯 ㅎ',
      category: '서재 자랑',
      author: '강팔순',
      date: '1시간 전',
      likes: 73,
      comments: 2,
    ),
  ];

  final _search = TextEditingController();
  final _searchFocus = FocusNode();
  final List<String> _recent = [];

  String _query = '';
  int _category = 0;
  int _sort = 0;

  @override
  void initState() {
    super.initState();
    _search.addListener(() => setState(() {}));
    _searchFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _search.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  bool get _isSearching => _query.isNotEmpty || _category != 0;

  List<CommunityPost> get _results {
    final list = _allPosts.where((post) {
      if (_category != 0 && post.category != _categories[_category]) {
        return false;
      }
      if (_query.isEmpty) return true;
      return post.title.contains(_query) || post.content.contains(_query);
    }).toList();

    return switch (_sort) {
      1 => list.reversed.toList(),
      2 => list..sort((a, b) => b.likes.compareTo(a.likes)),
      _ => list,
    };
  }

  void _submit(String value) {
    final keyword = value.trim();
    _searchFocus.unfocus();
    setState(() {
      _query = keyword;
      if (keyword.isNotEmpty) {
        _recent
          ..remove(keyword)
          ..insert(0, keyword);
      }
    });
  }

  void _searchRecent(String keyword) {
    _search.text = keyword;
    _submit(keyword);
  }

  Future<void> _write() async {
    final posted = await context.push<bool>('/community/free/write');
    if (posted == true && mounted) {
      showAppToast(context, '게시물이 작성되었습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchFocused = _searchFocus.hasFocus;
    final results = _results;

    return Column(
      children: [
        AppBar(
          leading: GestureDetector(
            onTap: () => searchFocused ? _searchFocus.unfocus() : context.pop(),
            child: SvgIcon(name: 'back', size: AppIconSizes.lg),
          ),
          title: Text(
            searchFocused ? '검색' : '자유 게시판',
            style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
          ),
          actions: [
            GestureDetector(
              onTap: _write,
              child: SvgIcon(name: 'write', size: AppIconSizes.lg),
            ),
          ],
        ),
        SearchField(
          controller: _search,
          focusNode: _searchFocus,
          hintText: '책의 궁금한 내용을 검색해보세요.',
          onSubmitted: _submit,
        ),
        Expanded(
          child: searchFocused
              ? _searchFocusedBody()
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
                        SizedBox(height: 24),
                        _chips(),
                        SizedBox(height: 24),
                      ],
                      if (!_isSearching) ...[
                        SectionTitle('전체 게시물', trailing: _sortMenu()),
                        SizedBox(height: 4),
                      ],
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

  /// 검색창에 포커스가 있을 때: 입력 전에는 최근 검색어, 입력 중에는 빈 화면.
  Widget _searchFocusedBody() => _search.text.isEmpty
      ? SingleChildScrollView(
          child: RecentSearchPanel(
            keywords: _recent,
            onTap: _searchRecent,
            onRemove: (keyword) => setState(() => _recent.remove(keyword)),
            onClear: () => setState(_recent.clear),
          ),
        )
      : SizedBox.shrink();

  Widget _chips() => AppChipList(
    data: _categories,
    selectedIndex: _category,
    onSelected: (i) => setState(() => _category = i),
  );

  Widget _sortMenu() => SortMenuButton(
    options: _sorts,
    selected: _sort,
    onSelected: (i) => setState(() => _sort = i),
  );

  Widget _searchHeader(int count) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '검색 결과: $count건',
            style: AppTextStyles.caption1.copyWith(color: AppColors.neutral50),
          ),
          _sortMenu(),
        ],
      ),
      SizedBox(height: 12),
      _chips(),
      SizedBox(height: 12),
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
}
