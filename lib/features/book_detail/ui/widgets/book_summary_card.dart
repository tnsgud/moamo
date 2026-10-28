import 'package:flutter/material.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookSummaryCard extends StatelessWidget {
  const BookSummaryCard({
    super.key,
    required this.book,
    required this.description,
    required this.isExpanded,
    required this.onToggle,
  });

  final Book book;
  final String description;
  final bool isExpanded;
  final VoidCallback onToggle;

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              book.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.body1Bold.copyWith(
                                color: AppColors.neutral90,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggle,
                      child: SvgIcon(
                        name: isExpanded ? 'up' : 'down',
                        size: AppIconSizes.md,
                      ),
                    ),
                  ],
                ),
                Text(
                  book.author,
                  style: AppTextStyles.caption1.copyWith(
                    color: AppColors.neutral50,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '책 소개',
                  style: AppTextStyles.caption1Bold.copyWith(
                    color: AppColors.neutral90,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  maxLines: isExpanded ? null : 2,
                  overflow: isExpanded ? null : TextOverflow.ellipsis,
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.neutral50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
