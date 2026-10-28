import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/bookcase_decorate/model/bookshelf_template.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/theme/hex_color.dart';
import 'package:moamo/shared/widget/app_button.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/widget/book_info_tile.dart';

import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/bookcase_form_app_bar.dart';
import 'widgets/bookcase_preview.dart';
import 'widgets/bookcase_status_bar.dart';

class BookcaseFormScreen extends ConsumerStatefulWidget {
  const BookcaseFormScreen({super.key, this.id});

  static String createUrl = '/bookcase/new';
  static String editUrl = '/bookcase/:id/edit';

  /// null이면 새 책장 만들기.
  final String? id;

  @override
  ConsumerState<BookcaseFormScreen> createState() => _BookcaseFormScreenState();
}

class _BookcaseFormScreenState extends ConsumerState<BookcaseFormScreen> {
  String? get id => widget.id;

  /// 제거하려고 한 번 누른 책의 `book.id`. 한 번 더 누르면 책장에서 뺀다.
  String? _removing;

  Future<void> _tapBook(String bookshelfId, BookResponse book) async {
    if (_removing != book.id) {
      setState(() => _removing = book.id);
      return;
    }
    setState(() => _removing = null);
    try {
      await ref
          .read(bookshelfBooksProvider(bookshelfId).notifier)
          .remove(book.id);
      if (mounted) showAppToast(context, '책장에서 뺐어요.');
    } catch (_) {
      if (mounted) showAppToast(context, '책을 빼지 못했어요.', isError: true);
    }
  }

  /// 새 책장을 만들고 편집 화면으로 바꾼다. 실패하면 null.
  Future<String?> _create() async {
    final router = GoRouter.of(context);
    try {
      // 목록이 아직 안 불러와졌어도 개수를 정확히 세려고 future를 기다린다.
      final count = (await ref.read(myBookshelvesProvider.future)).length;
      final shelf = await ref
          .read(myBookshelvesProvider.notifier)
          .create('책장 ${count + 1}');
      router.pushReplacement('/bookcase/${shelf.id}/edit');
      return shelf.id;
    } catch (_) {
      if (mounted) showAppToast(context, '책장을 만들지 못했어요.', isError: true);
      return null;
    }
  }

  /// 책 검색 화면에 책장 id를 넘겨서, 고른 책이 이 책장에 담기게 한다.
  Future<void> _addBook() async {
    final router = GoRouter.of(context);
    final bookshelfId = id ?? await _create();
    if (bookshelfId == null) return;
    router.push('/book-search?bookshelfId=$bookshelfId');
  }

  @override
  Widget build(BuildContext context) {
    final id = this.id;
    final title = id == null
        ? '새 책장'
        : ref.watch(bookshelfProvider(id)).value?.name ?? '';
    final books = id == null
        ? null
        : ref.watch(bookshelfBooksProvider(id)).value;
    // 꾸미기 저장 시 이 provider 값이 바뀌어서, 돌아오면 미리보기가 바로 갱신된다.
    final decoration = id == null
        ? null
        : ref.watch(bookshelfDecorationProvider(id)).value;

    final addButton = AppButton(
      onTap: () => _addBook(),
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
              onSave: () => id == null ? _create() : context.pop(),
            ),
            // 검색창을 누르면 책 검색 화면으로 이동한다.
            GestureDetector(
              onTap: () => _addBook(),
              child: AbsorbPointer(child: SearchField(onSubmitted: (_) {})),
            ),
            SizedBox(height: 16),
            BookcaseStatusBar(total: books?.length ?? 0),
            SizedBox(height: 16),
            BookcasePreview(
              title: title,
              color: decoration == null
                  ? null
                  : hexToColor(decoration.coverColor),
              templateName: decoration == null
                  ? null
                  : bookshelfTemplateName(decoration.templateKey),
              bookTitles: [
                for (final b in [
                  ...?decoration?.books,
                ]..sort((a, b) => a.slot - b.slot))
                  b.book.title,
              ],
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
                      // 한 번 누르면 제거 오버레이, 한 번 더 누르면 책장에서 뺀다.
                      // 상세는 길게 누르면 연다.
                      onTap: () => _tapBook(id!, item.book),
                      onLongPress: () =>
                          context.push('/bookshelf/$id/book/${item.book.id}'),
                      child: BookInfoTile(
                        book: Book(
                          title: item.book.title,
                          author: item.book.authors ?? '',
                          category: item.book.classificationName ?? '',
                          imageUrl: item.book.coverImageUrl ?? '',
                          isCertification: false,
                        ),
                        coverOverlay: _removing == item.book.id
                            ? ColoredBox(
                                color: AppColors.neutral.withValues(alpha: .48),
                                child: Center(
                                  child: SvgIcon(
                                    name: 'delete',
                                    size: AppIconSizes.lg,
                                    color: AppColors.neutral0,
                                  ),
                                ),
                              )
                            : null,
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
