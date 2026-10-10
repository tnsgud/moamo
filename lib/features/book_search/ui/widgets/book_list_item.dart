import 'package:flutter/material.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookListItem extends StatelessWidget {
  const BookListItem({super.key, required this.book, this.trailing});

  final Book book;

  /// 기본 케밥 아이콘 대신 보여줄 위젯(예: 메뉴 버튼).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Container(
                width: 65,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: AppRadius.xxs,
                  color: AppColors.neutral50,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                          book.category,
                          style: AppTextStyles.caption2Bold.copyWith(
                            color: AppColors.neutral50,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      if (book.isCertification)
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
                      Text(
                        book.author,
                        style: AppTextStyles.caption1.copyWith(
                          color: AppColors.neutral50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ],
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
