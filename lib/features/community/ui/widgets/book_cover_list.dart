import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

import 'section_title.dart';

class BookCoverList extends StatelessWidget {
  const BookCoverList({super.key, required this.title, required this.titles});

  final String title;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < titles.length; i++) ...[
                if (i > 0) SizedBox(width: 11),
                GestureDetector(
                  onTap: () => context.push('/community/book/${i + 1}'),
                  child: SizedBox(
                    width: 81,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TODO: 책 표지 이미지로 교체
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.neutral50,
                            borderRadius: AppRadius.xxs,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          titles[i],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.caption1.copyWith(
                            color: AppColors.neutral70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
