import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/features/book_search/ui/widgets/book_list_item.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class BookList extends StatelessWidget {
  const BookList({super.key, this.title, this.action, required this.data});

  final String? title;
  final Widget? action;
  final List<Book> data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [if (title != null) Text(title!), ?action],
          ),
          SizedBox(height: 12),
          if (data.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_search_data.png',
                    width: 160,
                    height: 160,
                  ),
                  SizedBox(height: 24),
                  Text(
                    '책을 발견하지 못했어요!',
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.neutral90,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '검색어를 다시 확인해 주세요.',
                    style: AppTextStyles.caption1.copyWith(
                      color: AppColors.neutral50,
                    ),
                  ),
                ],
              ),
            ),
          for (var i = 0; i < data.length; i++) ...[
            if (i > 0) SizedBox(height: 20),
            BookListItem(book: data[i]),
          ],
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
