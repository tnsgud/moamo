import 'package:flutter/material.dart';
import 'package:moamo/features/my/model/reward_item.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

// 유니크 색상은 AppColors에 없어 이 파일에서만 쓴다.
const _uniqueBackground = Color(0xFFEBE1FB);
const _uniqueForeground = Color(0xFF6A3FD0);

class RarityBadge extends StatelessWidget {
  const RarityBadge(this.rarity, {super.key, this.large = false});

  final Rarity rarity;

  /// 뽑기 결과 카드에서 쓰는 큰 크기.
  final bool large;

  @override
  Widget build(BuildContext context) {
    final (background, foreground) = switch (rarity) {
      Rarity.normal => (AppColors.yellow200, AppColors.yellow),
      Rarity.rare => (AppColors.blue200, AppColors.blue),
      Rarity.unique => (_uniqueBackground, _uniqueForeground),
    };

    return Container(
      padding: large
          ? EdgeInsets.symmetric(horizontal: 20, vertical: 12)
          : EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadius.round,
      ),
      child: Text(
        rarity.label,
        style: (large ? AppTextStyles.subtitleBold : AppTextStyles.caption1)
            .copyWith(color: foreground),
      ),
    );
  }
}
