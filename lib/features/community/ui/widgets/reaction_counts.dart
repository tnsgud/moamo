import 'package:flutter/widgets.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class ReactionCounts extends StatelessWidget {
  const ReactionCounts({
    super.key,
    required this.likes,
    required this.comments,
  });

  final int likes, comments;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.body3.copyWith(color: AppColors.neutral50);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgIcon(name: 'heart_none', size: AppIconSizes.xs),
        SizedBox(width: 2),
        Text('$likes', style: style),
        SizedBox(width: 12),
        SvgIcon(name: 'comment', size: AppIconSizes.xs),
        SizedBox(width: 2),
        Text('$comments', style: style),
      ],
    );
  }
}
