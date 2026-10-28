import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moamo/features/book_search/model/recent_book_search_history_provider.dart';

import '../../../../shared/dimension/app_icon_sizes.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_text_styles.dart';
import '../../../../shared/widget/svg_icon.dart';

class RecentSearchHistory extends ConsumerWidget {
  const RecentSearchHistory({super.key, this.onSelected});

  /// 검색어를 누르면 호출된다.
  final ValueChanged<String>? onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchHistory = ref.watch(bookSearchHistoryProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '최근 검색어',
              style: AppTextStyles.btn2Bold.copyWith(
                color: AppColors.neutral90,
              ),
            ),
            GestureDetector(
              onTap: () => ref.read(bookSearchHistoryProvider.notifier).clear(),
              child: Text(
                '전체 삭제',
                style: AppTextStyles.btn2.copyWith(color: AppColors.neutral50),
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        Container(
          height: 40,
          padding: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.neutral15, width: 0.5),
            ),
          ),
          child: searchHistory.when(
            loading: () => Text('loading'),
            error: (error, _) => Text('error ${error}'),
            data: (data) {
              if (data.isEmpty) {
                return Text(
                  '최근 검색 내역이 없습니다.',
                  style: AppTextStyles.btn2.copyWith(
                    color: AppColors.neutral40,
                  ),
                );
              }

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => onSelected?.call(data[index].keyword),
                      child: Text(
                        data[index].keyword,
                        style: AppTextStyles.btn2.copyWith(
                          color: AppColors.neutral40,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    GestureDetector(
                      onTap: () => ref
                          .read(bookSearchHistoryProvider.notifier)
                          .delete(data[index].id),
                      child: SvgIcon(
                        name: 'delete',
                        size: AppIconSizes.md,
                        color: AppColors.neutral20,
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(width: 12),
                itemCount: data.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
