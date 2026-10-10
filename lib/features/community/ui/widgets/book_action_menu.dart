import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

/// 검색된 책 카드의 케밥 메뉴. 내 책장에 없는 책에만 "내 책장에 추가"가 나온다.
class BookActionMenu extends StatelessWidget {
  const BookActionMenu({
    super.key,
    required this.isInLibrary,
    required this.onAdd,
    required this.onCertify,
  });

  final bool isInLibrary;
  final VoidCallback onAdd;
  final VoidCallback onCertify;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VoidCallback>(
      padding: EdgeInsets.zero,
      color: AppColors.neutral05,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
      onSelected: (action) => action(),
      itemBuilder: (context) => [
        if (!isInLibrary) _item(onAdd, '내 책장에 추가', 'add'),
        _item(onCertify, '인증', 'success'),
      ],
      child: SvgIcon(
        name: 'kebab',
        size: AppIconSizes.md,
        color: AppColors.neutral40,
      ),
    );
  }

  PopupMenuItem<VoidCallback> _item(
    VoidCallback action,
    String label,
    String icon,
  ) => PopupMenuItem(
    value: action,
    child: Row(
      children: [
        SvgIcon(name: icon, size: AppIconSizes.md, color: AppColors.neutral90),
        SizedBox(width: 8),
        Text(
          label,
          style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
        ),
      ],
    ),
  );
}
