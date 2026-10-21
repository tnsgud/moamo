import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/book_search/ui/widgets/app_chip_list.dart';
import 'package:moamo/features/book_search/ui/widgets/book_list_item.dart';
import 'package:moamo/features/community/model/community_post.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/book_action_menu.dart';
import 'widgets/post_list_item.dart';
import 'widgets/section_title.dart';
import 'widgets/sort_menu_button.dart';

typedef _SearchBook = ({Book book, bool inLibrary});

class CommunitySearchScreen extends StatefulWidget {
  const CommunitySearchScreen({super.key, required this.query});

  static String url = '/community/search';

  final String query;

  @override
  State<CommunitySearchScreen> createState() => _CommunitySearchScreenState();
}

class _CommunitySearchScreenState extends State<CommunitySearchScreen> {
  static const _categories = ['전체', '자기계발서', '소설', '경제·경영서', '에세이'];
  static const _libraryTabs = ['내 책장', '전체 책장'];
  static const _sorts = ['최신순', '오래된 순', '인기순'];

  // TODO: 서버 검색 결과로 교체
  static final List<_SearchBook> _catalog = [
    (
      book: Book(
        title: '아몬드',
        author: '작가 손원평',
        category: '소설',
        imageUrl: '',
        isCertification: true,
      ),
      inLibrary: true,
    ),
    (
      book: Book(
        title: '아몬드를 먹는 고양이',
        author: '작가 손원평',
        category: '소설',
        imageUrl: '',
        isCertification: false,
      ),
      inLibrary: true,
    ),
    (
      book: Book(
        title: '아몬드 초콜릿 왈츠',
        author: '작가 손원평',
        category: '소설',
        imageUrl: '',
        isCertification: true,
      ),
      inLibrary: true,
    ),
    (
      book: Book(
        title: '아몬드 한 줌의 습관',
        author: '김아몬',
        category: '자기계발서',
        imageUrl: '',
        isCertification: false,
      ),
      inLibrary: false,
    ),
  ];
  static const _posts = [
    CommunityPost(
      title: '곰이를 어떻게 생각하시나요?',
      content: '아니 아무리 해리가 지들 다락방에 얹혀산다고 해도 너무 함부로 굴지 않음?\n해리 너무 불쌍해ㅠ',
      category: '아몬드',
      author: '강팔순',
      date: '1시간 전',
      likes: 73,
      comments: 2,
    ),
    CommunityPost(
      title: '윤재가 더 외로운 사람인가요?ㅠ',
      content: '여기 이상한 단어가 적혀있는데 이거 출판사에 신고하면 돈 받나요',
      category: '아몬드',
      author: '피우피우',
      date: '26/03/27',
      likes: 73,
      comments: 2,
    ),
  ];

  late final _search = TextEditingController(text: widget.query);
  late String _query = widget.query;
  bool _showAllBooks = false;
  int _category = 0;
  int _libraryTab = 0;
  int _sort = 0;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  List<_SearchBook> get _bookResults {
    final list = _catalog.where((e) {
      final matches =
          e.book.title.contains(_query) || e.book.author.contains(_query);
      final inCategory =
          _category == 0 || e.book.category == _categories[_category];
      final inTab = !_showAllBooks || _libraryTab == 1 || e.inLibrary;
      return matches && inCategory && inTab;
    }).toList();

    return _sort == 1 ? list.reversed.toList() : list;
  }

  List<CommunityPost> get _postResults =>
      _posts.where((p) => p.category.contains(_query)).toList();

  void _submit(String value) => setState(() => _query = value.trim());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => _showAllBooks
                    ? setState(() => _showAllBooks = false)
                    : context.pop(),
                child: SvgIcon(name: 'back', size: AppIconSizes.lg),
              ),
              SizedBox(width: 12),
              Expanded(
                child: SearchField(
                  controller: _search,
                  hintText: '책 정보로 커뮤니티를 찾아보세요.',
                  onSubmitted: _submit,
                ),
              ),
            ],
          ),
        ),
        if (_showAllBooks)
          Divider(height: 0.5, thickness: 0.5, color: AppColors.neutral15),
        Expanded(child: _showAllBooks ? _bookTabView() : _overview()),
      ],
    );
  }

  Widget _overview() {
    final books = _bookResults;
    final posts = _postResults;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          AppChipList(
            data: _categories,
            selectedIndex: _category,
            onSelected: (i) => setState(() => _category = i),
          ),
          SizedBox(height: 32),
          if (books.isEmpty && posts.isEmpty)
            _empty()
          else ...[
            if (books.isNotEmpty) ...[
              SectionTitle(
                '검색 결과: ${books.length}건',
                trailing: _viewAll(() => setState(() => _showAllBooks = true)),
              ),
              SizedBox(height: 12),
              for (final e in books.take(2)) ...[
                _bookItem(e),
                SizedBox(height: 12),
              ],
              SizedBox(height: 20),
            ],
            if (posts.isNotEmpty) ...[
              SectionTitle('검색 결과: $_query', trailing: _viewAll(() {})),
              SizedBox(height: 4),
              for (var i = 0; i < posts.length; i++) ...[
                if (i > 0)
                  Divider(
                    height: 0.5,
                    thickness: 0.5,
                    color: AppColors.neutral15,
                  ),
                PostListItem(post: posts[i]),
              ],
            ],
          ],
        ],
      ),
    );
  }

  Widget _bookTabView() {
    final books = _bookResults;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          _libraryTabBar(),
          SizedBox(height: 24),
          SectionTitle(
            '검색 결과: ${books.length}건',
            trailing: books.isEmpty
                ? null
                : SortMenuButton(
                    options: _sorts,
                    selected: _sort,
                    onSelected: (i) => setState(() => _sort = i),
                  ),
          ),
          SizedBox(height: 12),
          if (books.isEmpty)
            Padding(padding: EdgeInsets.only(top: 60), child: _empty())
          else
            for (final e in books) ...[_bookItem(e), SizedBox(height: 12)],
        ],
      ),
    );
  }

  Widget _libraryTabBar() => ClipRRect(
    borderRadius: AppRadius.round,
    child: Container(
      height: 37,
      color: AppColors.neutral10,
      child: Row(
        children: [
          for (var i = 0; i < _libraryTabs.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _libraryTab = i),
                child: Container(
                  alignment: Alignment.center,
                  color: i == _libraryTab
                      ? AppColors.secondary100
                      : Colors.transparent,
                  child: Text(
                    _libraryTabs[i],
                    style: i == _libraryTab
                        ? AppTextStyles.btn2Bold.copyWith(
                            color: AppColors.neutral0,
                          )
                        : AppTextStyles.btn2.copyWith(
                            color: AppColors.neutral50,
                          ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );

  Widget _bookItem(_SearchBook e) => BookListItem(
    book: e.book,
    trailing: BookActionMenu(
      isInLibrary: e.inLibrary,
      onAdd: () => showAppToast(context, '내 책장에 추가되었습니다.'),
      onCertify: () => context.go('/certification'),
    ),
  );

  Widget _viewAll(VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Text(
          '전체 보기',
          style: AppTextStyles.body1.copyWith(color: AppColors.neutral),
        ),
        SvgIcon(name: 'next', size: AppIconSizes.sm),
      ],
    ),
  );

  Widget _empty() => Center(
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
          '책을 발견하지 못했어요!',
          style: AppTextStyles.subtitle.copyWith(color: AppColors.neutral90),
        ),
        SizedBox(height: 8),
        Text(
          '검색어를 다시 확인해 주세요.',
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral50),
        ),
      ],
    ),
  );
}
