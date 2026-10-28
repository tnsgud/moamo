import 'package:flutter/material.dart';

import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/widget/app_chip.dart';

import 'package:moamo/features/book_search/ui/widgets/sort_button.dart';

class BookcaseStatusBar extends StatelessWidget {
  const BookcaseStatusBar({super.key, required this.total});

  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.neutral15, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppChip(
                name: '전체: ${total.toString().padLeft(2, '0')}/20',
                isSelected: true,
              ),
              SizedBox(width: 8),
              AppChip(name: '인증: 00', isSelected: false),
              SizedBox(width: 8),
              AppChip(name: '미인증: 00', isSelected: false),
            ],
          ),
          SortButton(),
        ],
      ),
    );
  }
}
