import 'package:flutter/material.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class BookInfoTile extends StatelessWidget {
  const BookInfoTile({super.key, required this.book, this.coverOverlay});

  final Book book;

  /// 표지 위에 겹쳐 그릴 위젯 (예: 선택 표시).
  final Widget? coverOverlay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: AppRadius.xxs,
              ),
              child: book.imageUrl.isEmpty
                  ? null
                  : Image.network(book.imageUrl, fit: BoxFit.cover),
            ),
            if (coverOverlay != null)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: AppRadius.xxs,
                  child: coverOverlay,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          book.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.caption2.copyWith(color: AppColors.neutral90),
        ),
        const SizedBox(height: 2),
        Text(
          book.author,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.caption2.copyWith(color: AppColors.neutral50),
        ),
      ],
    );
  }
}
