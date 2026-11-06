import 'package:flutter/material.dart';
import 'package:moamo/features/book_search/model/book_category.dart';
import 'package:moamo/shared/api/models/book_metadata.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_skeleton.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key, required this.book, this.trailing});

  final BookMetadata book;

  /// 기본 케밥 아이콘 대신 보여줄 위젯(예: 메뉴 버튼).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final category = bookCategoryLabel(book.classificationName);

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral20),
        borderRadius: AppRadius.lg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                // 로딩 뼈대에서 표지 상자도 뼈대 색으로 칠한다.
                Skeleton.leaf(
                  child: Container(
                    width: 65,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: AppRadius.xxs,
                      color: AppColors.neutral50,
                    ),
                    child: book.coverImageUrl != null
                        ? Image.network(book.coverImageUrl!)
                        : null,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // 분류가 없어도 자리는 남겨서 배치가 바뀌지 않게 한다.
                          Visibility.maintain(
                            visible: category != null,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.neutral05,
                                borderRadius: AppRadius.xs,
                              ),
                              child: Text(
                                category ?? '분류',
                                style: AppTextStyles.caption2Bold.copyWith(
                                  color: AppColors.neutral50,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          if (true)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.neutral05,
                                borderRadius: AppRadius.xs,
                              ),
                              child: Text(
                                '인증',
                                style: AppTextStyles.caption2Bold.copyWith(
                                  color: AppColors.neutral50,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: AppTextStyles.btn2.copyWith(
                              color: AppColors.neutral90,
                            ),
                          ),
                          SizedBox(height: 6),
                          if (book.authors != null)
                            Text(
                              book.authors!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.caption1.copyWith(
                                color: AppColors.neutral50,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),

          trailing ??
              SvgIcon(
                name: 'kebab',
                size: AppIconSizes.md,
                color: AppColors.neutral40,
              ),
        ],
      ),
    );
  }
}
