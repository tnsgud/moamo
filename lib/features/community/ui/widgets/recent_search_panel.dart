import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class RecentSearchPanel extends StatelessWidget {
  const RecentSearchPanel({
    super.key,
    required this.keywords,
    required this.onTap,
    required this.onRemove,
    required this.onClear,
  });

  final List<String> keywords;
  final ValueChanged<String> onTap;
  final ValueChanged<String> onRemove;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '최근 검색어',
              style: AppTextStyles.btn2Bold.copyWith(
                color: AppColors.neutral90,
              ),
            ),
            GestureDetector(
              onTap: onClear,
              child: Text(
                '전체 삭제',
                style: AppTextStyles.btn2.copyWith(color: AppColors.neutral50),
              ),
            ),
          ],
        ),
        if (keywords.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text(
                '최근 검색 내역이 없습니다.',
                style: AppTextStyles.body1.copyWith(color: AppColors.neutral40),
              ),
            ),
          )
        else
          for (final keyword in keywords)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(keyword),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      keyword,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.neutral70,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => onRemove(keyword),
                      child: SvgIcon(
                        name: 'X',
                        size: AppIconSizes.sm,
                        color: AppColors.neutral40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        Divider(height: 0.5, thickness: 0.5, color: AppColors.neutral15),
      ],
    );
  }
}
