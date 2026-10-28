import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/theme/hex_color.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_dialog.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/bookcase_list_card.dart';

class BookcaseListScreen extends ConsumerStatefulWidget {
  const BookcaseListScreen({super.key});

  static String url = '/bookcases';

  @override
  ConsumerState<BookcaseListScreen> createState() => _BookcaseListScreenState();
}

class _BookcaseListScreenState extends ConsumerState<BookcaseListScreen> {
  // 펼침·활성 여부는 서버에 없는 화면 상태라 책장 id로 따로 들고 있는다.
  final Set<String> _collapsed = {};
  final Set<String> _disabled = {};

  bool _isEditing = false;

  void _confirmDelete(BookshelfResponse shelf) {
    showDialog(
      context: context,
      builder: (dialogContext) => AppDialog(
        title: '${shelf.name}을(를) 삭제하시겠습니까?',
        description: '삭제된 책장은 복구할 수 없습니다.',
        actions: [
          AppDialogAction(
            label: '취소',
            isPrimary: false,
            onTap: () => dialogContext.pop(),
          ),
          AppDialogAction(
            label: '삭제',
            onTap: () async {
              dialogContext.pop();
              try {
                await ref.read(myBookshelvesProvider.notifier).delete(shelf.id);
              } catch (_) {
                if (mounted) {
                  showAppToast(context, '책장을 삭제하지 못했어요.', isError: true);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bookshelves = ref.watch(myBookshelvesProvider);
    final shelves = bookshelves.value ?? [];

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
                  '총 ${shelves.length}개',
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
          child: bookshelves.when(
            data: (shelves) => ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: shelves.length,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, i) {
                final shelf = shelves[i];
                final color = hexToColor(shelf.coverColor);
                final books = ref.watch(bookshelfBooksProvider(shelf.id)).value;

                return GestureDetector(
                  onTap: _isEditing
                      ? null
                      : () => context.push('/bookcase/${shelf.id}/edit'),
                  child: BookcaseListCard(
                    title: shelf.name,
                    books: [
                      for (final (j, b) in (books ?? []).take(6).indexed)
                        (b.book.title, color, j == 0),
                    ],
                    isExpanded: !_collapsed.contains(shelf.id),
                    isEditing: _isEditing,
                    isEnabled: !_disabled.contains(shelf.id),
                    onToggleExpanded: () => setState(
                      () => _collapsed.contains(shelf.id)
                          ? _collapsed.remove(shelf.id)
                          : _collapsed.add(shelf.id),
                    ),
                    onEnabledChanged: (value) => setState(
                      () => value
                          ? _disabled.remove(shelf.id)
                          : _disabled.add(shelf.id),
                    ),
                    onDelete: () => _confirmDelete(shelf),
                  ),
                );
              },
            ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(
              child: GestureDetector(
                onTap: () => ref.invalidate(myBookshelvesProvider),
                child: Text(
                  '책장을 불러오지 못했어요. 탭해서 다시 시도',
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.neutral50,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
