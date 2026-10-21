import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_button.dart';
import 'package:moamo/shared/widget/book_info_tile.dart';

import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/bookcase_form_app_bar.dart';
import 'widgets/bookcase_preview.dart';
import 'widgets/bookcase_status_bar.dart';

class BookcaseFormScreen extends StatelessWidget {
  const BookcaseFormScreen({super.key, this.id});

  static String createUrl = '/bookcase/new';
  static String editUrl = '/bookcase/:id/edit';

  final int? id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            BookcaseFormAppBar(title: '책장 1'),
            SearchField(onSubmitted: (value) {}),
            SizedBox(height: 16),
            BookcaseStatusBar(),
            SizedBox(height: 16),
            BookcasePreview(
              title: '책장 1',
              onTap: () {
                context.push('/bookcase/decorate');
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
                children: id == null
                    ? [
                        AppButton(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              '책 추가하기',
                              style: AppTextStyles.caption1.copyWith(
                                color: AppColors.neutral60,
                              ),
                            ),
                          ),
                        ),
                      ]
                    : [
                        ...List.generate(
                          19,
                          (index) => BookInfoTile(
                            book: Book(
                              title: '해리포터와 마법사의 돌',
                              author: '조앤 K.롤링',
                              category: '소설',
                              imageUrl: '',
                              isCertification: false,
                            ),
                          ),
                        ),
                        AppButton(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              '책 추가하기',
                              style: AppTextStyles.caption1.copyWith(
                                color: AppColors.neutral60,
                              ),
                            ),
                          ),
                        ),
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
