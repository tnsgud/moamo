import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moamo/features/book_detail/data/book_memos_provider.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/features/library/ui/add_book_to_bookshelf.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/bookcase_select_button.dart';
import 'widgets/book_summary_card.dart';
import 'widgets/certification_tab.dart';
import 'widgets/memo_tab.dart';

class BookDetailScreen extends ConsumerStatefulWidget {
  const BookDetailScreen({
    super.key,
    required this.bookshelfId,
    required this.bookId,
  });

  final String bookshelfId;

  /// ISBN이 아니라 `book.id`.
  final String bookId;
  static String url = '/bookshelf/:bookshelfId/book/:bookId';

  @override
  ConsumerState<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends ConsumerState<BookDetailScreen> {
  static const _tabs = ['메모', '인증'];

  bool _isExpanded = false;
  int _tab = 0;

  /// 다른 책장을 고르면 그 책장에도 같은 책(ISBN)을 담는다.
  Future<void> _addToBookshelf(BookshelfResponse shelf, String isbn) =>
      addBookToBookshelf(
        context,
        ref,
        bookshelfId: shelf.id,
        shelfName: shelf.name,
        isbn: isbn,
      );

  @override
  Widget build(BuildContext context) {
    final item = ref
        .watch(bookshelfBookProvider(widget.bookshelfId, widget.bookId))
        .value;
    final shelves = ref.watch(myBookshelvesProvider).value ?? [];
    final selected = shelves.indexWhere((s) => s.id == widget.bookshelfId);
    final memos = ref.watch(
      bookMemosProvider(widget.bookshelfId, widget.bookId),
    );

    return Column(
      children: [
        AppBar(
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: SvgIcon(name: 'back', size: AppIconSizes.lg),
          ),
          title: Text(
            '상세페이지',
            style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BookSummaryCard(
                  book: Book(
                    title: item?.book.title ?? '',
                    author: item?.book.authors ?? '',
                    category: item?.book.classificationName ?? '',
                    imageUrl: item?.book.coverImageUrl ?? '',
                    isCertification: false,
                  ),
                  description: item?.book.description ?? '',
                  isExpanded: _isExpanded,
                  onToggle: () => setState(() => _isExpanded = !_isExpanded),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '책장 등록/그룹 지정',
                      style: AppTextStyles.btn2Bold.copyWith(
                        color: AppColors.neutral90,
                      ),
                    ),
                    if (selected >= 0)
                      BookcaseSelectButton(
                        bookcases: [for (final s in shelves) s.name],
                        selected: selected,
                        onSelected: (i) {
                          if (i != selected && item != null) {
                            _addToBookshelf(shelves[i], item.book.isbn);
                          }
                        },
                      ),
                  ],
                ),
                SizedBox(height: 24),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: AppColors.neutral15,
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    for (var i = 0; i < _tabs.length; i++) ...[
                      if (i > 0) SizedBox(width: 8),
                      Expanded(child: _tabButton(i)),
                    ],
                  ],
                ),
                SizedBox(height: 24),
                if (_tab == 0)
                  MemoTab(
                    memoUrl:
                        '/bookshelf/${widget.bookshelfId}/book/${widget.bookId}/memo',
                    memos: memos.value ?? [],
                    onDelete: (memo) async {
                      try {
                        await ref
                            .read(
                              bookMemosProvider(
                                widget.bookshelfId,
                                widget.bookId,
                              ).notifier,
                            )
                            .delete(memo.id);
                      } catch (_) {
                        if (context.mounted) {
                          showAppToast(
                            context,
                            '메모를 삭제하지 못했어요.',
                            isError: true,
                          );
                        }
                      }
                    },
                  )
                else
                  CertificationTab(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabButton(int index) {
    final selected = index == _tab;

    return GestureDetector(
      onTap: () => setState(() => _tab = index),
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          color: selected ? AppColors.secondary100 : AppColors.neutral10,
          borderRadius: AppRadius.sm,
        ),
        child: Center(
          child: Text(
            _tabs[index],
            style: selected
                ? AppTextStyles.btn2Bold.copyWith(color: AppColors.neutral0)
                : AppTextStyles.btn2.copyWith(color: AppColors.neutral50),
          ),
        ),
      ),
    );
  }
}
