import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_dialog.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'memo_card.dart';

class MemoTab extends StatelessWidget {
  const MemoTab({
    super.key,
    required this.memoUrl,
    required this.memos,
    required this.onDelete,
  });

  /// 메모 작성 화면 경로. 수정은 뒤에 `?memoId=`를 붙인다.
  final String memoUrl;
  final List<BookMemoResponse> memos;
  final ValueChanged<BookMemoResponse> onDelete;

  void _confirmDelete(BuildContext context, BookMemoResponse memo) {
    showDialog(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: '메모를 삭제하시겠습니까?',
        description: '삭제된 메모는 복구할 수 없습니다.',
        actions: [
          AppDialogAction(
            label: '취소',
            isPrimary: false,
            onTap: () => dialogContext.pop(),
          ),
          AppDialogAction(
            label: '삭제',
            onTap: () {
              onDelete(memo);
              dialogContext.pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '작성한 메모',
              style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
            ),
            GestureDetector(
              onTap: () => context.push(memoUrl),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: AppRadius.sm,
                ),
                child: Row(
                  children: [
                    SvgIcon(name: 'add', size: AppIconSizes.sm),
                    SizedBox(width: 6),
                    Text(
                      '작성하기',
                      style: AppTextStyles.btn2Bold.copyWith(
                        color: AppColors.neutral90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        if (memos.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Text(
              '아직 작성한 메모가 없어요.',
              style: AppTextStyles.subtitle.copyWith(
                color: AppColors.neutral50,
              ),
            ),
          ),
        for (final memo in memos) ...[
          MemoCard(
            memo: memo,
            onEdit: () => context.push('$memoUrl?memoId=${memo.id}'),
            onDelete: () => _confirmDelete(context, memo),
          ),
          SizedBox(height: 12),
        ],
      ],
    );
  }
}
