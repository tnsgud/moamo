import 'package:flutter/material.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookSearchInput extends StatelessWidget {
  const BookSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 20, right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral40),
        borderRadius: AppRadius.round,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              cursorHeight: 18,
              textInputAction: TextInputAction.search,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: AppColors.neutral50,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: '책 제목 / 작가명으로 검색해보세요.',
                hintStyle: AppTextStyles.btn2.copyWith(
                  color: AppColors.neutral40,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SvgIcon(
            name: 'search',
            size: AppIconSizes.lg,
            color: AppColors.neutral40,
          ),
        ],
      ),
    );
  }
}
