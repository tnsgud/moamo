import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/theme/hex_color.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/book_search/ui/widgets/app_chip_list.dart';
import 'package:moamo/features/book_search/ui/widgets/sort_button.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_button.dart';
import 'package:moamo/shared/widget/book_info_tile.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/cover_color_picker.dart';
import 'widgets/decorate_preview.dart';

class BookcaseDecorateScreen extends ConsumerStatefulWidget {
  const BookcaseDecorateScreen({super.key, required this.id});

  static String url = '/bookcase/:id/decorate';

  final String id;

  @override
  ConsumerState<BookcaseDecorateScreen> createState() =>
      _BookcaseDecorateScreenState();
}

class _BookcaseDecorateScreenState
    extends ConsumerState<BookcaseDecorateScreen> {
  // 템플릿 키는 프런트 자산 식별값이라 여기서 정한다. 서버 기본값은 DEFAULT.
  static const _templates = [
    ('DEFAULT', '기본'),
    ('FULL', '책 한가득'),
    ('SUMMER', '여름 책장'),
    ('MINIMAL', '미니멀'),
    ('MAXIMAL', '맥시멀'),
  ];

  static const _colors = [
    AppColors.blue200,
    AppColors.blue400,
    AppColors.blue600,
    AppColors.blue800,
    AppColors.blue,
  ];

  int _colorIndex = 0;
  int _templateIndex = 0;

  /// 미리보기에 고른 책의 `book.id` (고른 순서대로).
  List<String> _selected = [];
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    // 저장된 꾸미기 값으로 화면을 한 번 채운다.
    ref.listenManual(bookshelfDecorationProvider(widget.id), (_, next) {
      final d = next.value;
      if (d == null) return;
      setState(() {
        _colorIndex = _colors
            .indexWhere((c) => colorToHex(c) == d.coverColor.toUpperCase())
            .clamp(0, _colors.length - 1);
        _templateIndex = _templates
            .indexWhere((t) => t.$1 == d.templateKey)
            .clamp(0, _templates.length - 1);
        _selected = [
          for (final b in [...d.books]..sort((a, b) => a.slot - b.slot))
            b.book.id,
        ];
      });
    }, fireImmediately: true);
  }

  void _toggle(String bookId) => setState(() {
    if (!_selected.remove(bookId) &&
        _selected.length < DecoratePreview.maxBooks) {
      _selected.add(bookId);
    }
  });

  Future<void> _save(BookshelfDecorationResponse current) async {
    // 책·아이템 slot(0~5)은 겹치면 안 되므로, 아이템이 쓰지 않는 칸에 책을 놓는다.
    final itemSlots = current.items.map((e) => e.slot).toSet();
    final free = [
      for (var s = 0; s < 6; s++)
        if (!itemSlots.contains(s)) s,
    ];

    setState(() => _saving = true);
    try {
      await ref
          .read(bookshelfDecorationProvider(widget.id).notifier)
          .save(
            BookshelfDecorationRequest(
              name: current.name,
              templateKey: _templates[_templateIndex].$1,
              coverColor: colorToHex(_colors[_colorIndex]),
              books: [
                for (final (i, bookId) in _selected.indexed)
                  BookshelfPreviewBookRequest(
                    bookId: bookId,
                    slot: free[i],
                    displayType: i == 0
                        ? BookshelfBookDisplayType.front
                        : BookshelfBookDisplayType.spine,
                  ),
              ],
              items: current.items,
            ),
          );
      if (mounted) context.pop();
    } catch (_) {
      if (mounted) showAppToast(context, '책장을 저장하지 못했어요.', isError: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  static const _padding = EdgeInsets.symmetric(
    horizontal: AppBaseSizes.bodyHorizontal,
  );

  Widget _band() => Container(height: 12, color: AppColors.neutral05);

  @override
  Widget build(BuildContext context) {
    final decoration = ref.watch(bookshelfDecorationProvider(widget.id)).value;
    final books = ref.watch(bookshelfBooksProvider(widget.id)).value ?? [];
    final titles = {for (final b in books) b.book.id: b.book.title};

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: _padding,
              child: AppBar(
                leading: GestureDetector(
                  onTap: () => context.pop(),
                  child: SvgIcon(name: 'back', size: AppIconSizes.lg),
                ),
                title: Text(
                  decoration?.name ?? '',
                  style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
                ),
                actions: [
                  SvgIcon(
                    name: 'write',
                    size: AppIconSizes.lg,
                    color: AppColors.neutral40,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _band(),
                    Padding(
                      padding: _padding.copyWith(top: 24, bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '책장 템플릿 선택',
                            style: AppTextStyles.subtitleBold.copyWith(
                              color: AppColors.neutral90,
                            ),
                          ),
                          SizedBox(height: 16),
                          AppChipList(
                            data: [for (final t in _templates) t.$2],
                            selectedIndex: _templateIndex,
                            onSelected: (i) =>
                                setState(() => _templateIndex = i),
                          ),
                          SizedBox(height: 24),
                          Divider(
                            height: 0.5,
                            thickness: 0.5,
                            color: AppColors.neutral15,
                          ),
                          SizedBox(height: 24),
                          DecoratePreview(
                            color: _colors[_colorIndex],
                            titles: [
                              for (final id in _selected) titles[id] ?? '',
                            ],
                            itemCount: decoration?.items.length ?? 0,
                          ),
                          SizedBox(height: 24),
                          CoverColorPicker(
                            colors: _colors,
                            selected: _colorIndex,
                            onSelected: (i) => setState(() => _colorIndex = i),
                          ),
                        ],
                      ),
                    ),
                    _band(),
                    Padding(
                      padding: _padding.copyWith(top: 24, bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '책 선택',
                                style: AppTextStyles.subtitleBold.copyWith(
                                  color: AppColors.neutral90,
                                ),
                              ),
                              Row(
                                children: [
                                  AppButton(
                                    onTap: () => context.push(
                                      '/book-search?bookshelfId=${widget.id}',
                                    ),
                                    child: Text(
                                      '책 추가하기',
                                      style: AppTextStyles.caption1Bold
                                          .copyWith(color: AppColors.neutral60),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  SortButton(),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          GridView.count(
                            crossAxisCount: 4,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 24,
                            mainAxisExtent: 120,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              for (final item in books)
                                GestureDetector(
                                  onTap: () => _toggle(item.book.id),
                                  child: _selectable(
                                    order: _selected.indexOf(item.book.id),
                                    child: BookInfoTile(
                                      book: Book(
                                        title: item.book.title,
                                        author: item.book.authors ?? '',
                                        category:
                                            item.book.classificationName ?? '',
                                        imageUrl: item.book.coverImageUrl ?? '',
                                        isCertification: false,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.only(top: 8),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: AppColors.neutral15,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: Text(
                              '${_selected.length}/${DecoratePreview.maxBooks}',
                              style: AppTextStyles.subtitle.copyWith(
                                color: AppColors.neutral50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: _padding.copyWith(top: 8, bottom: 8),
              child: GestureDetector(
                onTap: decoration == null || _saving
                    ? null
                    : () => _save(decoration),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: AppRadius.md,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon(name: 'pin', size: AppIconSizes.sm),
                      SizedBox(width: 8),
                      Text(
                        '책장 저장하기',
                        style: AppTextStyles.btn2Bold.copyWith(
                          color: AppColors.neutral90,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 고른 책이면 고른 순서를 표지 위에 표시한다. [order]가 -1이면 미선택.
  Widget _selectable({required int order, required Widget child}) => Stack(
    children: [
      child,
      if (order >= 0)
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${order + 1}',
              style: AppTextStyles.caption2Bold.copyWith(
                color: AppColors.neutral90,
              ),
            ),
          ),
        ),
    ],
  );
}
