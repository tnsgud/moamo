import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_button.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/widget/book_info_tile.dart';

import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/bookcase_form_app_bar.dart';
import 'widgets/bookcase_preview.dart';
import 'widgets/bookcase_status_bar.dart';

class BookcaseFormScreen extends ConsumerWidget {
  const BookcaseFormScreen({super.key, this.id});

  static String createUrl = '/bookcase/new';
  static String editUrl = '/bookcase/:id/edit';

  /// null이면 새 책장 만들기.
  final String? id;

  /// 새 책장을 만들고 편집 화면으로 바꾼다. 실패하면 null.
  Future<String?> _create(BuildContext context, WidgetRef ref) async {
    final router = GoRouter.of(context);
    try {
      final count = ref.read(myBookshelvesProvider).value?.length ?? 0;
      final shelf = await ref
          .read(myBookshelvesProvider.notifier)
          .create('책장 ${count + 1}');
      router.pushReplacement('/bookcase/${shelf.id}/edit');
      return shelf.id;
    } catch (_) {
      if (context.mounted) {
        showAppToast(context, '책장을 만들지 못했어요.', isError: true);
      }
      return null;
    }
  }

  /// 책 검색 화면에 책장 id를 넘겨서, 고른 책이 이 책장에 담기게 한다.
  Future<void> _addBook(BuildContext context, WidgetRef ref) async {
    final router = GoRouter.of(context);
    final bookshelfId = id ?? await _create(context, ref);
    if (bookshelfId == null) return;
    router.push('/book-search?bookshelfId=$bookshelfId');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = this.id;
    final title = id == null
        ? '새 책장'
        : ref.watch(bookshelfProvider(id)).value?.name ?? '';
    final books = id == null
        ? null
        : ref.watch(bookshelfBooksProvider(id)).value;

    final addButton = AppButton(
      onTap: () => _addBook(context, ref),
      child: Center(
        child: Text(
          '책 추가하기',
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral60),
        ),
      ),
    );

    return Stack(
      children: [
        Column(
          children: [
            BookcaseFormAppBar(
              title: title,
              onSave: () => id == null ? _create(context, ref) : context.pop(),
            ),
            // 검색창을 누르면 책 검색 화면으로 이동한다.
            GestureDetector(
              onTap: () => _addBook(context, ref),
              child: AbsorbPointer(child: SearchField(onSubmitted: (_) {})),
            ),
            SizedBox(height: 16),
            BookcaseStatusBar(total: books?.length ?? 0),
            SizedBox(height: 16),
            BookcasePreview(
              title: title,
              onTap: () {
                if (id != null) context.push('/bookcase/$id/decorate');
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 25,
                mainAxisSpacing: 24,
                mainAxisExtent: 120,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom + 24,
                ),
                children: [
                  for (final item in books ?? [])
                    GestureDetector(
                      onTap: () =>
                          context.push('/bookshelf/$id/book/${item.book.id}'),
                      child: BookInfoTile(
                        book: Book(
                          title: item.book.title,
                          author: item.book.authors ?? '',
                          category: item.book.classificationName ?? '',
                          imageUrl: item.book.coverImageUrl ?? '',
                          isCertification: false,
                        ),
                      ),
                    ),
                  addButton,
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          bottom: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: AppRadius.round,
              color: AppColors.secondary100,
            ),
            child: Row(
              children: [
                SvgIcon(
                  name: 'pre',
                  size: AppIconSizes.lg,
                  color: AppColors.neutral0,
                ),
                Text(
                  '되돌리기',
                  style: AppTextStyles.btn2Bold.copyWith(
                    color: AppColors.neutral0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
