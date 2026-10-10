import 'package:flutter/widgets.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.subtitleBold.copyWith(
            color: AppColors.neutral90,
          ),
        ),
        ?trailing,
      ],
    );
  }
}
