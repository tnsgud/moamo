import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/ui/widgets/app_chip_list.dart';
import 'package:moamo/features/my/model/reward_item.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/reward_item_card.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({super.key});

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {
  static const _filters = ['전체', '노말', '레어', '유니크'];

  // TODO: 보유 수량을 서버 데이터로 교체
  static const _counts = [100, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
  static const _total = 14;

  int _filter = 0;

  @override
  Widget build(BuildContext context) {
    final owned = [
      for (var i = 0; i < rewardCatalog.length; i++)
        if (_filter == 0 || rewardCatalog[i].rarity.index == _filter - 1)
          (item: rewardCatalog[i], count: _counts[i]),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppBaseSizes.bodyHorizontal,
          ),
          child: Column(
            children: [
              AppBar(
                leading: GestureDetector(
                  onTap: () => context.pop(),
                  child: SvgIcon(name: 'back', size: AppIconSizes.lg),
                ),
                title: Text(
                  '보유 아이템',
                  style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _summary(),
                      SizedBox(height: 32),
                      AppChipList(
                        data: _filters,
                        selectedIndex: _filter,
                        onSelected: (i) => setState(() => _filter = i),
                      ),
                      SizedBox(height: 24),
                      GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 113,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for (final e in owned)
                            RewardItemCard(item: e.item, count: e.count),
                        ],
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summary() => Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.neutral15),
      borderRadius: AppRadius.xl,
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '나의 아이템',
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.neutral90,
                ),
              ),
              Text(
                '$_total개',
                style: AppTextStyles.h2.copyWith(color: AppColors.primary),
              ),
              SizedBox(height: 4),
              Text(
                '모은 아이템으로 나만의 서재를 꾸며보세요!',
                style: AppTextStyles.caption1.copyWith(
                  color: AppColors.neutral50,
                ),
              ),
            ],
          ),
        ),
        // TODO: 선물 상자 일러스트로 교체
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.profile,
            borderRadius: AppRadius.sm,
          ),
        ),
      ],
    ),
  );
}
