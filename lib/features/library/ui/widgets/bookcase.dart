import 'package:flutter/widgets.dart';
import 'package:moamo/features/library/ui/widgets/library_book.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class Bookcase extends StatelessWidget {
  const Bookcase({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral15, width: 0.5),
        borderRadius: AppRadius.lg,
        color: AppColors.neutral0,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 10,
            color: AppColors.neutral90.withValues(alpha: 0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.subtitleBold.copyWith(
              color: AppColors.neutral90,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              LibraryBook(
                title: '해리포터와 마법사의 돌',
                isExtended: true,
                color: AppColors.yellow200,
              ),
              SizedBox(width: 8),
              LibraryBook(
                title: '해리포터와 마법사의 돌',
                isExtended: false,
                color: AppColors.yellow,
              ),
              SizedBox(width: 8),
              LibraryBook(
                title: '해리포터와 마법사의 돌',
                isExtended: false,
                color: AppColors.yellow800,
              ),
              SizedBox(width: 8),
              LibraryBook(
                title: '해리포터와 마법사의 돌',
                isExtended: false,
                color: AppColors.yellow600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
