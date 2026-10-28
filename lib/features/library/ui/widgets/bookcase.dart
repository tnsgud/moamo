import 'package:flutter/widgets.dart';
import 'package:moamo/features/library/ui/widgets/library_book.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class Bookcase extends StatelessWidget {
  const Bookcase({
    super.key,
    required this.title,
    required this.color,
    required this.bookTitles,
  });

  final String title;

  /// 책장 표지 색상.
  final Color color;
  final List<String> bookTitles;

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
          if (bookTitles.isEmpty)
            Text(
              '아직 담긴 책이 없어요.',
              style: AppTextStyles.body2.copyWith(color: AppColors.neutral50),
            )
          else
            Row(
              children: [
                // 첫 책은 앞표지, 나머지는 책등. 한 줄에 들어가도록 6권까지.
                for (final (i, t) in bookTitles.take(6).indexed) ...[
                  if (i > 0) SizedBox(width: 8),
                  LibraryBook(title: t, isExtended: i == 0, color: color),
                ],
              ],
            ),
        ],
      ),
    );
  }
}
