import 'package:flutter/material.dart';
import 'package:moamo/features/library/ui/widgets/library_book.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookcaseListCard extends StatelessWidget {
  const BookcaseListCard({
    super.key,
    required this.title,
    required this.books,
    required this.isExpanded,
    required this.isEditing,
    required this.isEnabled,
    required this.onToggleExpanded,
    required this.onEnabledChanged,
    required this.onDelete,
    this.isLoading = false,
  });

  final String title;

  /// 책 목록을 아직 불러오는 중인지.
  final bool isLoading;

  /// (제목, 색상, 제목이 보이는 큰 책 여부)
  final List<(String, Color, bool)> books;
  final bool isExpanded;
  final bool isEditing;
  final bool isEnabled;
  final VoidCallback onToggleExpanded;
  final ValueChanged<bool> onEnabledChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    // 편집 중에는 모든 책장의 내용을 펼쳐서 보여준다.
    final showBooks = isExpanded || isEditing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        border: Border.all(color: AppColors.neutral15, width: 0.5),
        borderRadius: AppRadius.xl,
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
          SizedBox(
            height: AppIconSizes.lg,
            child: Row(
              children: [
                Text(
                  title,
                  style: AppTextStyles.subtitleBold.copyWith(
                    color: isEnabled || !isEditing
                        ? AppColors.neutral90
                        : AppColors.neutral40,
                  ),
                ),
                if (isEditing) ...[SizedBox(width: 8), _switch()],
                Spacer(),
                GestureDetector(
                  onTap: isEditing ? onDelete : onToggleExpanded,
                  child: SvgIcon(
                    name: isEditing ? 'delete' : (isExpanded ? 'up' : 'down'),
                    size: AppIconSizes.lg,
                  ),
                ),
              ],
            ),
          ),
          if (showBooks) ...[
            SizedBox(height: 24),
            if (books.isEmpty)
              // 책 목록을 불러오는 중에는 "없어요"를 띄우지 않는다.
              Visibility.maintain(
                visible: !isLoading,
                child: Text(
                  '아직 담긴 책이 없어요.',
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.neutral50,
                  ),
                ),
              )
            else
              Row(
                children: [
                  for (var i = 0; i < books.length; i++) ...[
                    if (i > 0) SizedBox(width: 8),
                    LibraryBook(
                      title: books[i].$1,
                      isExtended: books[i].$3,
                      color: books[i].$2,
                    ),
                  ],
                ],
              ),
          ],
        ],
      ),
    );
  }

  Widget _switch() => Transform.scale(
    scale: 0.8,
    child: Switch(
      value: isEnabled,
      onChanged: onEnabledChanged,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: AppColors.neutral15,
      activeThumbColor: AppColors.neutral0,
      inactiveThumbColor: AppColors.neutral0,
      trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
    ),
  );
}
