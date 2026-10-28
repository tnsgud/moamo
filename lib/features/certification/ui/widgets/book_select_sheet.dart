import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

/// 내 서재의 책을 골라 [Book]으로 돌려주는 바텀시트.
Future<Book?> showBookSelectSheet(BuildContext context, List<Book> books) {
  return showModalBottomSheet<Book>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.neutral0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    builder: (context) => FractionallySizedBox(
      heightFactor: 0.88,
      child: _BookSelectSheet(books: books),
    ),
  );
}

class _BookSelectSheet extends StatefulWidget {
  const _BookSelectSheet({required this.books});

  final List<Book> books;

  @override
  State<_BookSelectSheet> createState() => _BookSelectSheetState();
}

class _BookSelectSheetState extends State<_BookSelectSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final books = widget.books
        .where((b) => b.title.contains(_query) || b.author.contains(_query))
        .toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '책 선택',
                style: AppTextStyles.subtitleBold.copyWith(
                  color: AppColors.neutral90,
                ),
              ),
              GestureDetector(
                onTap: () => context.pop(),
                child: SvgIcon(name: 'X', size: AppIconSizes.lg),
              ),
            ],
          ),
          SizedBox(height: 16),
          SearchField(
            hintText: '내 서재에 있는 책을 찾아보세요.',
            onSubmitted: (value) => setState(() => _query = value.trim()),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                bottom: MediaQuery.paddingOf(context).bottom + 20,
              ),
              itemCount: books.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => context.pop(books[i]),
                child: _BookCard(book: books[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  const _BookCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral15, width: 0.5),
        borderRadius: AppRadius.xl,
      ),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 83,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: AppRadius.xxs,
            ),
            child: book.imageUrl.isEmpty
                ? null
                : Image.network(book.imageUrl, fit: BoxFit.cover),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.neutral05,
                  borderRadius: AppRadius.xs,
                ),
                child: Text(
                  book.category,
                  style: AppTextStyles.caption2.copyWith(
                    color: AppColors.neutral70,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                book.title,
                style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
              ),
              SizedBox(height: 4),
              Text(
                book.author,
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
}
