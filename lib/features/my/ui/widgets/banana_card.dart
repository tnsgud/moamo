import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class BananaCard extends StatelessWidget {
  const BananaCard({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.neutral05,
        borderRadius: AppRadius.xl,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '내 바나나',
                style: AppTextStyles.body1.copyWith(color: AppColors.neutral50),
              ),
              Text(
                '$count 개',
                style: AppTextStyles.h2.copyWith(color: AppColors.neutral60),
              ),
            ],
          ),
          Row(
            children: [
              _pill(context, '보유 아이템', '/my/items', isPrimary: false),
              SizedBox(width: 8),
              _pill(context, '랜덤뽑기', '/my/draw', isPrimary: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pill(
    BuildContext context,
    String label,
    String route, {
    required bool isPrimary,
  }) => GestureDetector(
    onTap: () => context.push(route),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primary : AppColors.primary08,
        border: isPrimary ? null : Border.all(color: AppColors.primary),
        borderRadius: AppRadius.round,
      ),
      child: Text(
        label,
        style: isPrimary
            ? AppTextStyles.btn2Bold.copyWith(color: AppColors.neutral90)
            : AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
      ),
    ),
  );
}
