import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/widget/app_button.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () => {},
      child: SvgIcon(name: 'sorting', size: AppIconSizes.sm),
    );
  }
}
