import 'package:flutter/material.dart';
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

class BookcaseDecorateScreen extends StatefulWidget {
  const BookcaseDecorateScreen({super.key});

  static String url = '/bookcase/decorate';

  @override
  State<BookcaseDecorateScreen> createState() => _BookcaseDecorateScreenState();
}

class _BookcaseDecorateScreenState extends State<BookcaseDecorateScreen> {
  static const _colors = [
    AppColors.blue200,
    AppColors.blue400,
    AppColors.blue600,
    AppColors.blue800,
    AppColors.blue,
  ];

  int _colorIndex = 0;

  static const _padding = EdgeInsets.symmetric(
    horizontal: AppBaseSizes.bodyHorizontal,
  );

  Widget _band() => Container(height: 12, color: AppColors.neutral05);

  @override
  Widget build(BuildContext context) {
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
                  '책장 1',
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
                            data: ['기본', '책 한가득', '여름 책장', '미니멀', '맥시멀'],
                          ),
                          SizedBox(height: 24),
                          Divider(
                            height: 0.5,
                            thickness: 0.5,
                            color: AppColors.neutral15,
                          ),
                          SizedBox(height: 24),
                          DecoratePreview(color: _colors[_colorIndex]),
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
                                    onTap: () {},
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
                            children: List.generate(
                              8,
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
                              '1/3',
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
                onTap: () => context.pop(),
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
}
