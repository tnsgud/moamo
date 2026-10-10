import 'package:flutter/material.dart';
import 'package:moamo/features/my/model/reward_item.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

import 'rarity_badge.dart';

class RewardItemCard extends StatelessWidget {
  const RewardItemCard({super.key, required this.item, required this.count});

  final RewardItem item;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral15, width: 0.5),
        borderRadius: AppRadius.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: 아이템 일러스트로 교체
          Expanded(
            child: Center(
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.profile,
                  borderRadius: AppRadius.sm,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral90),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RarityBadge(item.rarity),
              Text(
                count > 99 ? 'x99+' : 'x$count',
                style: AppTextStyles.body1.copyWith(color: AppColors.neutral90),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
