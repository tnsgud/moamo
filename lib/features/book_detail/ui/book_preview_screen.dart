import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/book_search/model/book_search_provider.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/features/library/ui/add_book_to_bookshelf.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/book_summary_card.dart';

/// 책장에 담기 전 책 상세 (검색 결과·추천에서 진입).
///
/// 담기에 성공하면 `true`로 닫힌다. 여는 쪽은 그 값을 보고 자기도 닫으면
/// 책장 편집 화면까지 돌아간다. 책 목록은 provider 무효화로 알아서 갱신된다.
class BookPreviewScreen extends ConsumerStatefulWidget {
  const BookPreviewScreen({
    super.key,
    required this.isbn,
    this.bookshelfId,
    this.initial,
  });

  static String url = '/book/isbn/:isbn';

  final String isbn;

  /// 책장 편집에서 왔으면 그 책장. 없으면 담을 때 책장을 고른다.
  final String? bookshelfId;

  /// 검색 결과로 이미 받은 책 정보. 없으면 ISBN으로 다시 조회한다.
  final BookMetadata? initial;

  @override
  ConsumerState<BookPreviewScreen> createState() => _BookPreviewScreenState();
}

class _BookPreviewScreenState extends ConsumerState<BookPreviewScreen> {
  bool _isExpanded = false;
  bool _adding = false;

  Future<void> _add() async {
    setState(() => _adding = true);
    try {
      final shelfId = widget.bookshelfId;
      final BookshelfResponse? shelf = shelfId == null
          ? await pickBookshelf(context, ref)
          : ref.read(bookshelfProvider(shelfId)).value;
      final id = shelfId ?? shelf?.id;
      if (id == null || !mounted) return;
      final ok = await addBookToBookshelf(
        context,
        ref,
        bookshelfId: id,
        shelfName: shelf?.name ?? '책장',
        isbn: widget.isbn,
      );
      if (ok && mounted) context.pop(true);
    } finally {
      if (mounted) setState(() => _adding = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final book =
        widget.initial ?? ref.watch(externalBookProvider(widget.isbn)).value;

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
          child: book == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: BookSummaryCard(
                    book: Book(
                      title: book.title,
                      author: book.authors ?? '',
                      category: book.classificationName ?? '',
                      imageUrl: book.coverImageUrl ?? '',
                      isCertification: false,
                    ),
                    description: book.description ?? '',
                    isExpanded: _isExpanded,
                    onToggle: () => setState(() => _isExpanded = !_isExpanded),
                  ),
                ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: GestureDetector(
            onTap: book == null || _adding ? null : _add,
            child: Container(
              width: double.infinity,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: AppRadius.md,
              ),
              child: Text(
                '책장에 담기',
                style: AppTextStyles.btn2Bold.copyWith(
                  color: AppColors.neutral90,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
