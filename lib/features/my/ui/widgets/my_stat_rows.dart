import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

/// 이번 달 독서 요약 (읽은 책 / 독서 시간 / 연속 독서).
class ReadingSummary extends StatelessWidget {
  const ReadingSummary({super.key, required this.stats});

  /// (값, 라벨) 목록.
  final List<(String value, String label)> stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.neutral05,
        borderRadius: AppRadius.xl,
      ),
      child: _DividedRow(
        children: [
          for (final (value, label) in stats)
            Column(
              children: [
                _IconPlaceholder(size: 28),
                SizedBox(height: 8),
                Text(
                  value,
                  style: AppTextStyles.h3.copyWith(color: AppColors.neutral70),
                ),
                Text(
                  label,
                  style: AppTextStyles.caption2.copyWith(
                    color: AppColors.neutral40,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// 성장 그래프 / 커뮤니티 관리 / 친구 초대 바로가기.
class MyShortcuts extends StatelessWidget {
  const MyShortcuts({super.key, required this.labels, this.onTap});

  final List<String> labels;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return _DividedRow(
      children: [
        for (var i = 0; i < labels.length; i++)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap?.call(i),
            child: Column(
              children: [
                _IconPlaceholder(size: 36),
                SizedBox(height: 8),
                Text(
                  labels[i],
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.neutral60,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _DividedRow extends StatelessWidget {
  const _DividedRow({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0)
              VerticalDivider(
                width: 1,
                thickness: 0.5,
                indent: 8,
                endIndent: 8,
                color: AppColors.neutral20,
              ),
            Expanded(child: children[i]),
          ],
        ],
      ),
    );
  }
}

// TODO: 아이콘 일러스트가 준비되면 교체
class _IconPlaceholder extends StatelessWidget {
  const _IconPlaceholder({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.profile,
        borderRadius: AppRadius.xs,
      ),
    );
  }
}
