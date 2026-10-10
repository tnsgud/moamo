import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class EmojiPanel extends StatelessWidget {
  const EmojiPanel({super.key, this.onSelected});

  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: Row(
              children: [
                SvgIcon(name: 'recent', size: AppIconSizes.lg),
                SizedBox(width: 20),
                SvgIcon(name: 'add', size: AppIconSizes.lg),
              ],
            ),
          ),
          Divider(height: 0.5, thickness: 0.5, color: AppColors.neutral15),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              padding: EdgeInsets.all(20),
              children: List.generate(
                8,
                // TODO: 이모티콘 이미지가 준비되면 교체
                (index) => GestureDetector(
                  onTap: () => onSelected?.call(index),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.profile,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
