import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookcasePreview extends StatelessWidget {
  const BookcasePreview({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.bookTitles = const [],
    this.templateName,
  });

  final String title;
  final VoidCallback onTap;

  /// 꾸미기에서 저장한 표지 색상.
  final Color? color;

  /// 꾸미기에서 고른 책 제목 (slot 순). 비어 있으면 안내 문구를 보여준다.
  final List<String> bookTitles;

  /// 적용된 템플릿 이름. null이면 아직 책장이 없는 것.
  final String? templateName;

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
            child: bookTitles.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        templateName == null
                            ? '선택된 템플릿이 없어요.'
                            : '$templateName 템플릿이 적용됐어요.',
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
                  )
                // 첫 책은 앞표지, 나머지는 책등 (꾸미기 미리보기와 같은 배치).
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (final (i, t) in bookTitles.indexed) ...[
                        if (i > 0) SizedBox(width: 8),
                        Container(
                          width: i == 0 ? 48 : 12,
                          height: 60,
                          padding: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: color ?? AppColors.blue200,
                            borderRadius: AppRadius.xxs,
                          ),
                          child: i == 0
                              ? Text(
                                  t,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.caption2.copyWith(
                                    color: AppColors.neutral90,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
