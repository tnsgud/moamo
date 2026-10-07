import 'package:flutter/material.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/book_search/ui/widgets/book_list.dart';
import 'package:moamo/features/book_search/ui/widgets/book_search_app_bar.dart';
import 'package:moamo/features/book_search/ui/widgets/book_search_input.dart';
import 'package:moamo/features/book_search/ui/widgets/category_chip_list.dart';
import 'package:moamo/features/book_search/ui/widgets/recent_search_history.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookSearchScreen extends StatelessWidget {
  BookSearchScreen({super.key});

  final List<Book> _books = [
    Book(
      title: '해리포터와 마법사의 돌',
      author: '조앤 K.롤링',
      category: '소설',
      imageUrl: '',
      isCertification: true,
    ),
    Book(
      title: '해리포토와 비밀의 방',
      author: '조앤 K.롤링',
      category: '소설',
      imageUrl: '',
      isCertification: false,
    ),
    Book(
      title: '해리포터와 아즈카바늬 죄수',
      author: '조앤 K.롤링',
      category: '소설',
      imageUrl: '',
      isCertification: false,
    ),
    Book(
      title: '해리포터와 불의 잔',
      author: '조앤 K.롤링',
      category: '소설',
      imageUrl: '',
      isCertification: false,
    ),
    Book(
      title: '해리포터와 죽음의 성물',
      author: '조앤 K.롤링',
      category: '소설',
      imageUrl: '',
      isCertification: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookSearchAppBar(),
        SizedBox(height: 14),
        BookSearchInput(),
        SizedBox(height: 24),
        RecentSearchHistory(data: ['해리포터', '오디세이', '후지이 카제', '식케이', '디오니소스']),
        SizedBox(height: 24),
        CategoryChipList(data: ['전체', '자기계발서', '소설', '경제•경영서', '에세이']),
        SizedBox(height: 32),
        Expanded(
          child: BookList(
            title: '많은 사람들이 찾고 있어요',
            action: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.primary08,
                borderRadius: AppRadius.sm,
                border: Border.all(color: AppColors.primary),
              ),
              child: SvgIcon(name: 'sorting', size: AppIconSizes.sm),
            ),
            data: _books,
          ),
        ),
      ],
    );
  }
}
