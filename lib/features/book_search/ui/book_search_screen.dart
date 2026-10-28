import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
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
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/widget/search_field.dart';

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

  void _submit(String value) {
    final keyword = value.trim();
    if (keyword.isEmpty) return;
    ref
        .read(bookSearchHistoryProvider.notifier)
        .add(keyword, BookSearchTarget.title);
    setState(() => query = keyword);
  }

  Future<void> _addToBookshelf(String bookshelfId, BookMetadata book) async {
    try {
      await ref
          .read(bookshelfBooksProvider(bookshelfId).notifier)
          .add(book.isbn);
      if (!mounted) return;
      showAppToast(context, '책장에 담았어요.');
      context.pop();
    } on DioException catch (e) {
      if (!mounted) return;
      showAppToast(
        context,
        e.response?.statusCode == 409 ? '이미 책장에 있는 책이에요.' : '책을 담지 못했어요.',
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookshelfId = widget.bookshelfId;

    if (query.isNotEmpty) {
      ref
          .watch(bookSearchProvider(query))
          .when(
            data: (data) {
              // data.books.map((b) => b.)
              ref.watch(bookRecommendationsProvider(data.books[0].isbn));
            },
            error: (error, _) => print('error:$error'),
            loading: () {},
          );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          BookSearchAppBar(),
          SearchField(onSubmitted: (value) => _submit(value)),
          SizedBox(height: 24),
          RecentSearchHistory(),
          SizedBox(height: 24),
          AppChipList(data: ['전체', '자기계발서', '소설', '경제•경영서', '에세이']),
          SizedBox(height: 32),
          BookList(
            title: '',
            action: SortButton(),
            onTap: bookshelfId == null
                ? null
                : (book) => _addToBookshelf(bookshelfId, book),
            data: query.isEmpty
                ? []
                : ref
                      .watch(bookSearchProvider(query))
                      .when(
                        data: (data) => data.books,
                        loading: () => [],
                        error: (error, _) => [],
                      ),
          ),
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
            children: [],
          ),
        ],
      ),
    );
  }
}
