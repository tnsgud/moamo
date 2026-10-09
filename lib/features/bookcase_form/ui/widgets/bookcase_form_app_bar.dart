import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_button.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookcaseFormAppBar extends StatelessWidget {
  const BookcaseFormAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => context.pop(),
        child: SvgIcon(name: 'back', size: AppIconSizes.lg),
      ),
      title: Text(
        title,
        style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
      ),
      actions: [
        AppButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: AppColors.neutral.withValues(alpha: .48),
                  child: Container(
                    width: 280,
                    padding: EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: AppColors.neutral0,
                      borderRadius: AppRadius.xl,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgIcon(name: 'save'),
                        SizedBox(height: 8),
                        Text(
                          '저장하시겠습니까?',
                          style: AppTextStyles.subtitleBold.copyWith(
                            color: AppColors.neutral90,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '완료 시 책장 변경 사항이 적용됩니다.',
                          style: AppTextStyles.body1Bold.copyWith(
                            color: AppColors.neutral40,
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => context.pop(true),
                          child: Container(
                            width: double.infinity,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: AppRadius.xs,
                            ),
                            child: Center(
                              child: Text(
                                '확인',
                                style: AppTextStyles.body1Bold.copyWith(
                                  color: AppColors.neutral90,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            '저장',
            style: AppTextStyles.caption1Bold.copyWith(
              color: AppColors.neutral90,
            ),
          ),
        ),
      ],
    );
  }
}
