import 'package:flutter/widgets.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class LibraryBook extends StatelessWidget {
  const LibraryBook({
    super.key,
    required this.title,
    required this.isExtended,
    required this.color,
  });

  final String title;
  final bool isExtended;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExtended ? 65 : 16,
      height: 80,
      decoration: BoxDecoration(borderRadius: AppRadius.xxs, color: color),
      padding: isExtended
          ? EdgeInsets.symmetric(horizontal: 8)
          : EdgeInsets.symmetric(horizontal: 2),
      child: Center(
        child: Text(
          isExtended ? title : '${title.characters.take(4).join('\n')}\n...',

          textAlign: TextAlign.start,
          style: AppTextStyles.caption2.copyWith(
            color: AppColors.neutral,
            height: 1.2,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
