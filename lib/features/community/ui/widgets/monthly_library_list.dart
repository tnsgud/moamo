import 'package:flutter/material.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

import 'section_title.dart';

class MonthlyLibraryList extends StatelessWidget {
  const MonthlyLibraryList({super.key, required this.owners});

  final List<String> owners;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('이달의 서재'),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              for (var i = 0; i < owners.length; i++) ...[
                if (i > 0) SizedBox(width: 17),
                Column(
                  children: [
                    // TODO: 프로필 이미지로 교체
                    Container(
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        color: AppColors.neutral05,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${owners[i]}님의\n서재',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption1.copyWith(
                        color: AppColors.neutral70,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
