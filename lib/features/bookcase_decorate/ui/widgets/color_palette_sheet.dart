import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

typedef ColorPalette = ({String name, List<Color> colors});

/// 책 표지 색상 팔레트. 각 팔레트는 밝은 색부터 5단계.
const colorPalettes = <ColorPalette>[
  (
    name: '옐로우',
    colors: [
      AppColors.yellow200,
      AppColors.yellow400,
      AppColors.yellow600,
      AppColors.yellow800,
      AppColors.yellow,
    ],
  ),
  (
    name: '그린',
    colors: [
      AppColors.green200,
      AppColors.green400,
      AppColors.green600,
      AppColors.green800,
      AppColors.green,
    ],
  ),
  (
    name: '블루',
    colors: [
      AppColors.blue200,
      AppColors.blue400,
      AppColors.blue600,
      AppColors.blue800,
      AppColors.blue,
    ],
  ),
  (
    name: '핑크',
    colors: [
      AppColors.pink200,
      AppColors.pink400,
      AppColors.pink600,
      AppColors.pink800,
      AppColors.pink,
    ],
  ),
  (
    name: '모노',
    colors: [
      AppColors.mono200,
      AppColors.mono400,
      AppColors.mono600,
      AppColors.mono800,
      AppColors.mono,
    ],
  ),
];

/// '색상 팔레트 선택' 바텀시트. 팔레트를 누를 때마다 [onSelected]로 바로 알린다.
Future<void> showColorPaletteSheet(
  BuildContext context, {
  required int selected,
  required ValueChanged<int> onSelected,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.neutral0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    builder: (context) =>
        _ColorPaletteSheet(selected: selected, onSelected: onSelected),
  );
}

class _ColorPaletteSheet extends StatefulWidget {
  const _ColorPaletteSheet({required this.selected, required this.onSelected});

  final int selected;
  final ValueChanged<int> onSelected;

  @override
  State<_ColorPaletteSheet> createState() => _ColorPaletteSheetState();
}

class _ColorPaletteSheetState extends State<_ColorPaletteSheet> {
  late int _selected = widget.selected;

  void _select(int i) {
    setState(() => _selected = i);
    widget.onSelected(i);
  }

  @override
  Widget build(BuildContext context) {
    final palette = colorPalettes[_selected];

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 24, 20, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 가로를 꽉 채워야 닫기 버튼이 오른쪽 끝에 붙는다.
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(width: double.infinity),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    '색상 팔레트 선택',
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.neutral90,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: SvgIcon(name: 'X', size: AppIconSizes.lg),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.neutral10,
                borderRadius: AppRadius.md,
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '현재 팔레트: ', style: AppTextStyles.btn2Bold),
                    TextSpan(text: palette.name, style: AppTextStyles.btn2),
                  ],
                ),
                style: TextStyle(color: AppColors.neutral90),
              ),
            ),
            SizedBox(height: 12),
            // 대표색은 가운데(3번째) 단계. 고른 팔레트만 크게 + 테두리.
            SizedBox(
              height: 66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (final (i, p) in colorPalettes.indexed)
                    GestureDetector(
                      onTap: () => _select(i),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 150),
                        width: i == _selected ? 66 : 48,
                        height: i == _selected ? 66 : 48,
                        decoration: BoxDecoration(
                          color: p.colors[2],
                          shape: BoxShape.circle,
                          border: i == _selected
                              ? Border.all(color: AppColors.focus, width: 2)
                              : null,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final (i, c) in palette.colors.indexed) ...[
                  if (i > 0) SizedBox(width: 8),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(color: c, shape: BoxShape.circle),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
