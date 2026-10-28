import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class CoverColorPicker extends StatelessWidget {
  const CoverColorPicker({
    super.key,
    required this.colors,
    required this.selected,
    required this.onSelected,
    required this.onPaletteTap,
  });

  final List<Color> colors;
  final int selected;
  final ValueChanged<int> onSelected;

  /// 오른쪽 아이콘을 누르면 호출 (팔레트 선택 시트 열기).
  final VoidCallback onPaletteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '책 표지 색상',
          style: AppTextStyles.subtitleBold.copyWith(
            color: AppColors.neutral90,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < colors.length; i++)
              GestureDetector(
                onTap: () => onSelected(i),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colors[i],
                    shape: BoxShape.circle,
                    border: i == selected
                        ? Border.all(color: AppColors.neutral70)
                        : null,
                  ),
                ),
              ),
            GestureDetector(
              onTap: onPaletteTap,
              child: SvgIcon(name: 'down', size: AppIconSizes.md),
            ),
          ],
        ),
      ],
    );
  }
}
