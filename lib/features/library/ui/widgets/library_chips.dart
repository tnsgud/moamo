import 'package:flutter/material.dart';
import 'package:moamo/shared/app_colors.dart';
import 'package:moamo/shared/app_radius.dart';
import 'package:moamo/shared/app_text_styles.dart';

class LibraryChips extends StatelessWidget {
  LibraryChips({super.key});

  final List<String> labels = ['인증도서', '누적 방문자', '투데이'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: labels
          .map(
            (e) => Container(
              decoration: BoxDecoration(
                color: AppColors.neutral05,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  Text(
                    '$e:',
                    style: AppTextStyles.btn2Bold.copyWith(
                      color: AppColors.neutral90,
                    ),
                  ),
                  Text(' 00'),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
