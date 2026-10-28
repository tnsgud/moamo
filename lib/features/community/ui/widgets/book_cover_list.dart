import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

import 'section_title.dart';

class BookCoverList extends StatelessWidget {
  const BookCoverList({
    super.key,
    required this.title,
    required this.titles,
    this.coverUrls = const [],
  });

  final String title;
  final List<String> titles;

  /// [titles]와 같은 순서의 표지 URL. 없으면 회색 상자.
  final List<String?> coverUrls;

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
                        Container(
                          height: 100,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: AppColors.neutral50,
                            borderRadius: AppRadius.xxs,
                          ),
                          child: i < coverUrls.length && coverUrls[i] != null
                              ? Image.network(coverUrls[i]!, fit: BoxFit.cover)
                              : null,
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
