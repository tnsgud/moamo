import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_dialog.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/bookcase_list_card.dart';

class _BookcaseItem {
  _BookcaseItem(this.title, this.books, {this.isExpanded = true});

  final String title;
  final List<(Color, bool)> books;
  bool isExpanded;
  bool isEnabled = true;
}

class BookcaseListScreen extends StatefulWidget {
  const BookcaseListScreen({super.key});

  @override
  State<BookcaseListScreen> createState() => _BookcaseListScreenState();
}

class _BookcaseListScreenState extends State<BookcaseListScreen> {
  // TODO: 서버 데이터로 교체
  final List<_BookcaseItem> _bookcases = [
    _BookcaseItem('책장 1', [
      (AppColors.blue600, false),
      (AppColors.blue200, true),
      (AppColors.blue800, false),
    ]),
    _BookcaseItem('책장 2', [
      (AppColors.yellow200, true),
      (AppColors.yellow, false),
      (AppColors.yellow800, false),
      (AppColors.yellow600, false),
      (AppColors.yellow200, true),
    ], isExpanded: false),
    _BookcaseItem('책장 3', [
      (AppColors.yellow200, true),
      (AppColors.yellow, false),
      (AppColors.yellow800, false),
      (AppColors.yellow600, false),
      (AppColors.yellow200, true),
      (AppColors.yellow200, true),
    ]),
    _BookcaseItem('책장 4', [
      (AppColors.green200, true),
      (AppColors.green600, false),
      (AppColors.green800, false),
    ]),
  ];

  bool _isEditing = false;

  void _confirmDelete(_BookcaseItem item) {
    showDialog(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: '${item.title}을(를) 삭제하시겠습니까?',
        description: '삭제된 책장은 복구할 수 없습니다.',
        actions: [
          AppDialogAction(
            label: '취소',
            isPrimary: false,
            onTap: () => dialogContext.pop(),
          ),
          AppDialogAction(
            label: '삭제',
            onTap: () {
              setState(() => _bookcases.remove(item));
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
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.neutral15, width: 0.5),
            ),
          ),
          child: AppBar(
            toolbarHeight: 64,
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: SvgIcon(name: 'back', size: AppIconSizes.lg),
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '전체 책장',
                  style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
                ),
                Text(
                  '총 ${_bookcases.length}개',
                  style: AppTextStyles.caption1Bold.copyWith(
                    color: AppColors.neutral40,
                  ),
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () => setState(() => _isEditing = !_isEditing),
                child: SvgIcon(name: 'write', size: AppIconSizes.lg),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => context.push('/bookcase/new'),
                child: SvgIcon(name: 'add', size: AppIconSizes.lg),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20),
            itemCount: _bookcases.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, i) {
              final item = _bookcases[i];

              return BookcaseListCard(
                title: item.title,
                books: item.books,
                isExpanded: item.isExpanded,
                isEditing: _isEditing,
                isEnabled: item.isEnabled,
                onToggleExpanded: () =>
                    setState(() => item.isExpanded = !item.isExpanded),
                onEnabledChanged: (value) =>
                    setState(() => item.isEnabled = value),
                onDelete: () => _confirmDelete(item),
              );
            },
          ),
        ),
      ],
    );
  }
}
