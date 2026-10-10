import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/my/model/reward_item.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/draw_cost_button.dart';
import 'widgets/draw_mascot.dart';
import 'widgets/rarity_badge.dart';

enum _Phase { idle, drawing, result }

class RandomDrawScreen extends StatefulWidget {
  const RandomDrawScreen({super.key});

  @override
  State<RandomDrawScreen> createState() => _RandomDrawScreenState();
}

class _RandomDrawScreenState extends State<RandomDrawScreen> {
  static const _singleCost = 20;
  static const _tenCost = 180;
  static const _drawDuration = Duration(milliseconds: 1500);

  final _random = Random();

  // TODO: 서버 데이터로 교체. 키는 rewardCatalog 인덱스.
  final Map<int, int> _inventory = {0: 1, 7: 2, 10: 1, 6: 2};

  _Phase _phase = _Phase.idle;
  int _bananas = 200;
  int? _pressedCost;
  List<int> _results = [];
  int _page = 0;

  bool get _drawing => _phase == _Phase.drawing;

  String get _message => switch (_phase) {
    _Phase.idle => '레어템도 있다숑~',
    _Phase.drawing => '떼구르르~',
    _Phase.result =>
      rewardCatalog[_results[_page]].rarity == Rarity.normal
          ? '오 좋은데숑~'
          : '헉 그거 대박이숑!',
  };

  /// 노말 70% / 레어 25% / 유니크 5%.
  int _pick() {
    final roll = _random.nextInt(100);
    final rarity = roll < 70
        ? Rarity.normal
        : roll < 95
        ? Rarity.rare
        : Rarity.unique;
    final candidates = [
      for (var i = 0; i < rewardCatalog.length; i++)
        if (rewardCatalog[i].rarity == rarity) i,
    ];
    return candidates[_random.nextInt(candidates.length)];
  }

  Future<void> _draw(int times, int cost) async {
    setState(() {
      _phase = _Phase.drawing;
      _pressedCost = cost;
    });
    await Future.delayed(_drawDuration);
    if (!mounted) return;

    final picks = List.generate(times, (_) => _pick());
    setState(() {
      _bananas -= cost;
      for (final i in picks) {
        _inventory[i] = (_inventory[i] ?? 0) + 1;
      }
      _results = picks;
      _page = 0;
      _pressedCost = null;
      _phase = _Phase.result;
    });
  }

  VoidCallback? _onDraw(int times, int cost) =>
      _drawing || _bananas < cost ? null : () => _draw(times, cost);

  @override
  Widget build(BuildContext context) {
    // 뽑는 동안은 카드 영역만 밝게 두고 나머지는 어둡게 가린다.
    final dim = _drawing ? 0.4 : 1.0;

    return Scaffold(
      backgroundColor: _drawing ? Color(0xFF6B6B6B) : AppColors.neutral0,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppBaseSizes.bodyHorizontal,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: dim,
                  child: AppBar(
                    leading: GestureDetector(
                      onTap: () => context.pop(),
                      child: SvgIcon(name: 'back', size: AppIconSizes.lg),
                    ),
                    title: Text(
                      '랜덤뽑기',
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.neutral90,
                      ),
                    ),
                    actions: [SvgIcon(name: 'question', size: AppIconSizes.lg)],
                  ),
                ),
                SizedBox(height: 36),
                DrawMascot(message: _message),
                _drawCard(),
                SizedBox(height: 32),
                Opacity(opacity: dim, child: _inventorySection()),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawCard() => Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.primary08,
      border: Border.all(color: AppColors.primary, width: 2),
      borderRadius: AppRadius.xl,
    ),
    child: Column(
      children: [
        _stage(),
        SizedBox(height: 12),
        Container(
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.neutral0,
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
            borderRadius: AppRadius.round,
          ),
          child: Text(
            '🍌 내 바나나: $_bananas개',
            style: AppTextStyles.btn2.copyWith(color: AppColors.neutral70),
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DrawCostButton(
                label: '1회 뽑기',
                cost: _singleCost,
                isSelected: _pressedCost == _singleCost,
                onTap: _onDraw(1, _singleCost),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: DrawCostButton(
                label: '10회 연속',
                cost: _tenCost,
                isSelected: _pressedCost == _tenCost,
                onTap: _onDraw(10, _tenCost),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  /// 뽑기 기계 또는 뽑기 결과를 보여주는 흰 카드.
  Widget _stage() {
    final showResult = _phase == _Phase.result;
    final item = showResult ? rewardCatalog[_results[_page]] : null;

    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
        borderRadius: AppRadius.lg,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // TODO: 뽑기 기계 / 아이템 일러스트로 교체
          if (item == null)
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: AppColors.profile,
                borderRadius: AppRadius.lg,
              ),
            )
          else
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.profile,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 16),
                RarityBadge(item.rarity, large: true),
              ],
            ),
          if (showResult && _results.length > 1) ...[
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.neutral10,
                  borderRadius: AppRadius.round,
                ),
                child: Text(
                  '${(_page + 1).toString().padLeft(2, '0')}/'
                  '${_results.length.toString().padLeft(2, '0')}',
                  style: AppTextStyles.btn2.copyWith(
                    color: AppColors.neutral60,
                  ),
                ),
              ),
            ),
            if (_page < _results.length - 1)
              Positioned(
                right: 12,
                child: GestureDetector(
                  onTap: () => setState(() => _page++),
                  child: SvgIcon(
                    name: 'next',
                    size: AppIconSizes.md,
                    color: AppColors.neutral50,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _inventorySection() {
    final owned = _inventory.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '내가 가진 아이템',
              style: AppTextStyles.subtitleBold.copyWith(
                color: AppColors.neutral90,
              ),
            ),
            GestureDetector(
              onTap: () => context.push('/my/items'),
              child: Row(
                children: [
                  Text(
                    '전체 보기',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.neutral,
                    ),
                  ),
                  SvgIcon(name: 'next', size: AppIconSizes.sm),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.neutral10,
            borderRadius: AppRadius.xl,
          ),
          child: Row(
            children: [
              for (final i in owned.take(4))
                Expanded(
                  child: Column(
                    children: [
                      // TODO: 아이템 일러스트로 교체
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.profile,
                          borderRadius: AppRadius.sm,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _inventory[i]! > 99 ? '99+개' : '${_inventory[i]}개',
                        style: AppTextStyles.body1.copyWith(
                          color: AppColors.neutral70,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
