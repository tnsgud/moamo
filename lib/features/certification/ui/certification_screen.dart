import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/features/book_detail/ui/widgets/certification_tab.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/book_select_sheet.dart';

class CertificationScreen extends ConsumerStatefulWidget {
  const CertificationScreen({super.key});

  static String url = '/certification';

  @override
  ConsumerState<CertificationScreen> createState() =>
      _CertificationScreenState();
}

class _CertificationScreenState extends ConsumerState<CertificationScreen> {
  Book? _selected;

  Future<void> _selectBook() async {
    final List<BookResponse> library;
    try {
      library = await ref.read(myLibraryBooksProvider.future);
    } catch (_) {
      if (mounted) showAppToast(context, '내 서재를 불러오지 못했어요.', isError: true);
      return;
    }
    if (!mounted) return;
    final books = [
      for (final b in library)
        Book(
          title: b.title,
          author: b.authors ?? '',
          category: b.classificationName ?? '',
          imageUrl: b.coverImageUrl ?? '',
          isCertification: false,
        ),
    ];
    final book = await showBookSelectSheet(context, books);
    if (book != null) setState(() => _selected = book);
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selected != null;

    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            title: Text(
              '독서 인증',
              style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
            ),
            actions: [SvgIcon(name: 'info_none', size: AppIconSizes.xl)],
          ),
          SizedBox(height: 40),
          Text(
            selected ? '선택한 책을 인증해 보세요!' : '인증할 책을 골라주세요!',
            style: AppTextStyles.h2Bold.copyWith(color: AppColors.neutral90),
          ),
          SizedBox(height: 4),
          Text(
            '바나나 포인트를 적립할 수 있어요.',
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral50),
          ),
          SizedBox(height: 24),
          GestureDetector(
            onTap: _selectBook,
            // TODO: 책 표지 이미지로 교체
            child: Container(
              width: 129,
              height: 166,
              decoration: BoxDecoration(
                color: selected ? AppColors.neutral50 : AppColors.neutral10,
                borderRadius: AppRadius.sm,
              ),
              child: selected
                  ? null
                  : Center(
                      child: SvgIcon(
                        name: 'add',
                        size: AppIconSizes.xl,
                        color: AppColors.neutral70,
                      ),
                    ),
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: _selectBook,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : AppColors.neutral10,
                borderRadius: AppRadius.round,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgIcon(
                    name: 'change',
                    size: AppIconSizes.sm,
                    color: selected ? AppColors.neutral90 : AppColors.neutral40,
                  ),
                  SizedBox(width: 6),
                  Text(
                    '책 변경',
                    style: AppTextStyles.btn2.copyWith(
                      color: selected
                          ? AppColors.neutral90
                          : AppColors.neutral40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          CertificationTab(
            isAiCertified: selected,
            isReviewCertified: selected,
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
