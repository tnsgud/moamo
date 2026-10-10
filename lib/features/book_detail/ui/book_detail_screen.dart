import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_detail/model/book_memo.dart';
import 'package:moamo/features/book_search/model/book.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/bookcase_select_button.dart';
import 'widgets/book_summary_card.dart';
import 'widgets/certification_tab.dart';
import 'widgets/memo_tab.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  // TODO: id로 책 정보를 조회하도록 교체
  static const _book = Book(
    title: '해리포터와 마법사의 돌',
    author: '조앤 K.롤링',
    category: '소설',
    imageUrl: '',
    isCertification: false,
  );
  static const _description =
      '1997년 영국에서 출간된 이래 <해리포터> 시리즈는 지금까지 200개국 이상 80개의 언어로 번역되고 출간되어 5억 부 이상을 판매했다. 이번에 출간하는 <해리포터> 시리즈는 지난 2019년에 새로운 번역을 선보인 버전이다.';
  static const _bookcases = ['책장 1', '책장 2', '책장 3'];
  static const _tabs = ['메모', '인증'];

  bool _isExpanded = false;
  int _bookcase = 0;
  int _tab = 0;
  final List<BookMemo> _memos = [
    BookMemo(date: '26/08/23', content: '스투페파이!!', hasImage: true),
    BookMemo(date: '26/08/23', content: '아니 나도 날아다니고 싶다'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: SvgIcon(name: 'back', size: AppIconSizes.lg),
          ),
          title: Text(
            '상세페이지',
            style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BookSummaryCard(
                  book: _book,
                  pages: 456,
                  description: _description,
                  isExpanded: _isExpanded,
                  onToggle: () => setState(() => _isExpanded = !_isExpanded),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '책장 등록/그룹 지정',
                      style: AppTextStyles.btn2Bold.copyWith(
                        color: AppColors.neutral90,
                      ),
                    ),
                    BookcaseSelectButton(
                      bookcases: _bookcases,
                      selected: _bookcase,
                      onSelected: (i) => setState(() => _bookcase = i),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: AppColors.neutral15,
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    for (var i = 0; i < _tabs.length; i++) ...[
                      if (i > 0) SizedBox(width: 8),
                      Expanded(child: _tabButton(i)),
                    ],
                  ],
                ),
                SizedBox(height: 24),
                if (_tab == 0)
                  MemoTab(
                    bookId: widget.id,
                    memos: _memos,
                    onDelete: (memo) => setState(() => _memos.remove(memo)),
                  )
                else
                  CertificationTab(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabButton(int index) {
    final selected = index == _tab;

    return GestureDetector(
      onTap: () => setState(() => _tab = index),
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          color: selected ? AppColors.secondary100 : AppColors.neutral10,
          borderRadius: AppRadius.sm,
        ),
        child: Center(
          child: Text(
            _tabs[index],
            style: selected
                ? AppTextStyles.btn2Bold.copyWith(color: AppColors.neutral0)
                : AppTextStyles.btn2.copyWith(color: AppColors.neutral50),
          ),
        ),
      ),
    );
  }
}
