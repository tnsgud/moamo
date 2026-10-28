import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_chip.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class DecoratePreview extends StatelessWidget {
  const DecoratePreview({
    super.key,
    required this.color,
    required this.titles,
    required this.itemCount,
  });

  static const maxBooks = 3;

  final Color color;

  /// 미리보기에 놓을 책 제목. 첫 책은 앞표지, 나머지는 책등으로 보여준다.
  final List<String> titles;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '책장 미리보기',
              style: AppTextStyles.subtitleBold.copyWith(
                color: AppColors.neutral90,
              ),
            ),
            SizedBox(width: 8),
            SvgIcon(
              name: 'info_none',
              size: AppIconSizes.xs,
              color: AppColors.primary,
            ),
            Spacer(),
            // AppChip(name: '책: 3/3', isSelected: false, textStyle: ,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.neutral05,
                borderRadius: AppRadius.sm,
              ),
              child: Text(
                '책 ${titles.length}/$maxBooks',
                style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
              ),
            ),
            SizedBox(width: 8),
            AppChip(name: '아이템: $itemCount/3', isSelected: false),
          ],
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 112,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral15),
            borderRadius: AppRadius.lg,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final (i, title) in titles.indexed) ...[
                if (i > 0) SizedBox(width: 8),
                i == 0 ? _front(title) : _spine(color, 15),
              ],
              Spacer(),
              for (var i = titles.length; i < maxBooks; i++) ...[
                if (i > titles.length) SizedBox(width: 12),
                _addSlot(),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _front(String title) => Container(
    width: 60,
    height: 75,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
      borderRadius: AppRadius.xxs,
      border: Border.all(color: AppColors.neutral70),
    ),
    child: Text(
      title,
      maxLines: 1,
      style: AppTextStyles.caption1.copyWith(
        overflow: TextOverflow.ellipsis,
        color: AppColors.neutral90,
      ),
    ),
  );

  Widget _spine(Color color, double width) => Container(
    width: width,
    height: 75,
    decoration: BoxDecoration(color: color, borderRadius: AppRadius.xxs),
  );

  Widget _addSlot() => Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.neutral20),
      borderRadius: AppRadius.xs,
    ),
    child: Icon(Icons.add_rounded, color: AppColors.neutral20),
  );
}
