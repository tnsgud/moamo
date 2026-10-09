import 'package:flutter/widgets.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookcasePreview extends StatelessWidget {
  const BookcasePreview({
    super.key,
    required this.title,
    this.id,
    required this.onTap,
  });

  final String title;
  final int? id;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 21, left: 21, bottom: 21),
      width: double.infinity,
      height: 161,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral15, width: 0.5),
        borderRadius: AppRadius.lg,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title 미리보기',
                style: AppTextStyles.subtitleBold.copyWith(
                  color: AppColors.neutral90,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgIcon(name: 'deco', size: AppIconSizes.md),
                      SizedBox(width: 4),
                      Text(
                        '책장 꾸미기',
                        style: AppTextStyles.caption1Bold.copyWith(
                          color: AppColors.neutral90,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '선택된 템플릿이 없어요.',
                  style: AppTextStyles.btn2.copyWith(
                    color: AppColors.neutral50,
                  ),
                ),
                Text(
                  '나만의 책장을 꾸며보세요!',
                  style: AppTextStyles.caption1.copyWith(
                    color: AppColors.neutral40,
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
