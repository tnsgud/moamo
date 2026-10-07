import 'package:flutter/material.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class RecentSearchHistory extends StatelessWidget {
  const RecentSearchHistory({super.key, required this.data});

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '최근 검색어',
              style: AppTextStyles.btn2Bold.copyWith(
                color: AppColors.neutral90,
              ),
            ),
            Text(
              '전체 삭제',
              style: AppTextStyles.btn2.copyWith(color: AppColors.neutral50),
            ),
          ],
        ),
        SizedBox(height: 24),
        Container(
          height: 40,
          padding: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.neutral15, width: 0.5),
            ),
          ),
          child: data.isEmpty
              ? Text(
                  '최근 검색 내역이 없습니다.',
                  style: AppTextStyles.btn2.copyWith(
                    color: AppColors.neutral40,
                  ),
                )
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[index],
                        style: AppTextStyles.btn2.copyWith(
                          color: AppColors.neutral40,
                        ),
                      ),
                      SizedBox(width: 2),
                      SvgIcon(
                        name: 'delete',
                        size: AppIconSizes.md,
                        color: AppColors.neutral20,
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemCount: data.length,
                ),
        ),
      ],
    );
  }
}
