import 'package:flutter/material.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/book_search/ui/widgets/book_list.dart';
import 'package:moamo/features/book_search/ui/widgets/book_search_app_bar.dart';
import 'package:moamo/shared/widget/book_info_tile.dart';
import 'package:moamo/shared/widget/search_field.dart';
import 'package:moamo/features/book_search/ui/widgets/app_chip_list.dart';
import 'package:moamo/features/book_search/ui/widgets/recent_search_history.dart';
import 'package:moamo/features/book_search/ui/widgets/sort_button.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
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

  bool searchResultVisible = true;
  int _count = 4;
  String title = '많은 사람들이 찾고 있어요';

  void _onSubmitted(String value) {
    if (value.contains('h')) {
      setState(() {
        searchResultVisible = false;
        _count = 0;
        title = '검색결과: 0건';
      });
      return;
    }

    _count = 4;

    setState(() {
      searchResultVisible = !searchResultVisible;

      if (searchResultVisible) {
        title = '검색결과: 1건';
      } else {
        title = '많은 사람들이 찾고 있어요';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BookSearchAppBar(),
          SearchField(onSubmitted: (value) => _onSubmitted(value)),
          SizedBox(height: 24),
          RecentSearchHistory(data: ['해리포터', '오디세이', '후지이 카제', '식케이', '디오니소스']),
          SizedBox(height: 24),
          AppChipList(data: ['전체', '자기계발서', '소설', '경제•경영서', '에세이']),
          SizedBox(height: 32),
          BookList(
            title: title,
            action: SortButton(),
            data: _count == 0
                ? []
                : searchResultVisible
                ? _books.take(1).toList()
                : _books,
          ),
          if (searchResultVisible) ...[
            Text(
              '함께 하면 좋을 책',
              style: AppTextStyles.subtitleBold.copyWith(
                color: AppColors.neutral90,
              ),
            ),

            GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 25,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisExtent: 130,
              children: [
                for (final book in _books.take(4)) BookInfoTile(book: book),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
