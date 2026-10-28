import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/model/book_search_provider.dart';
import 'package:moamo/features/book_search/model/recent_book_search_history_provider.dart';
import 'package:moamo/features/book_search/ui/widgets/app_chip_list.dart';
import 'package:moamo/features/book_search/ui/widgets/book_list.dart';
import 'package:moamo/features/book_search/ui/widgets/book_search_app_bar.dart';
import 'package:moamo/features/book_search/ui/widgets/recent_search_history.dart';
import 'package:moamo/features/book_search/ui/widgets/sort_button.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/book_info_tile.dart';
import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/features/book_search/model/book.dart';

class BookSearchScreen extends ConsumerStatefulWidget {
  const BookSearchScreen({super.key, this.bookshelfId});

  /// 책장 편집에서 들어오면, 고른 책을 이 책장에 담는다.
  final String? bookshelfId;

  static String url = '/book-search';

  @override
  ConsumerState<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends ConsumerState<BookSearchScreen> {
  String query = '';
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  /// 최근 검색어를 검색창에 넣는다 (커서는 끝으로).
  void _fill(String keyword) => _search.value = TextEditingValue(
    text: keyword,
    selection: TextSelection.collapsed(offset: keyword.length),
  );

  void _submit(String value) {
    final keyword = value.trim();
    if (keyword.isEmpty) return;
    ref
        .read(bookSearchHistoryProvider.notifier)
        .add(keyword, BookSearchTarget.title);
    setState(() => query = keyword);
  }

  /// 책 상세(담기 전)를 연다. 책장 편집에서 왔고 거기서 담았으면
  /// 검색 화면도 닫아서 책장 편집 화면으로 돌아간다.
  Future<void> _openBook(BookMetadata book) async {
    final bookshelfId = widget.bookshelfId;
    final added = await context.push<bool>(
      bookshelfId == null
          ? '/book/isbn/${book.isbn}'
          : '/book/isbn/${book.isbn}?bookshelfId=$bookshelfId',
      extra: book,
    );
    if (added == true && bookshelfId != null && mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final books = query.isEmpty
        ? <BookMetadata>[]
        : ref.watch(bookSearchProvider(query)).value?.books ?? [];
    // 첫 번째 검색 결과와 함께 읽으면 좋은 책.
    final recommendations = books.isEmpty
        ? <BookMetadata>[]
        : ref.watch(bookRecommendationsProvider(books.first.isbn)).value ?? [];

    return SingleChildScrollView(
      child: Column(
        children: [
          BookSearchAppBar(),
          SearchField(
            controller: _search,
            onSubmitted: (value) => _submit(value),
          ),
          SizedBox(height: 24),
          RecentSearchHistory(onSelected: _fill),
          SizedBox(height: 24),
          AppChipList(data: ['전체', '자기계발서', '소설', '경제•경영서', '에세이']),
          SizedBox(height: 32),
          BookList(
            title: '',
            action: SortButton(),
            onTap: _openBook,
            data: books,
          ),
          if (recommendations.isNotEmpty) ...[
            Text(
              '함께 하면 좋을 책',
              style: AppTextStyles.subtitleBold.copyWith(
                color: AppColors.neutral90,
              ),
            ),
            GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 25,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisExtent: 130,
              children: [
                for (final b in recommendations)
                  GestureDetector(
                    onTap: () => _openBook(b),
                    child: BookInfoTile(
                      book: Book(
                        title: b.title,
                        author: b.authors ?? '',
                        category: b.classificationName ?? '',
                        imageUrl: b.coverImageUrl ?? '',
                        isCertification: false,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
