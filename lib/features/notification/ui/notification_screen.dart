import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_search/ui/widgets/app_chip_list.dart';
import 'package:moamo/features/notification/model/notification_item.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  static const _categories = ['전체', '커뮤니티', '인증', '공지사항', '고객센터'];
  // TODO: 서버 데이터로 교체
  static const _items = [
    NotificationItem(
      category: '커뮤니티',
      message: '새로운 댓글: 해리포터 시리즈 읽어보셨나요?',
      time: '1시간 전',
    ),
    NotificationItem(
      category: '커뮤니티',
      message: '새로운 댓글: 듄 시리즈 읽어보셨나요? 듄이 해리포터보다 더 재밌잖아요 솔직히 말해보세요. 그쵸? 대답하세요',
      time: '08월 25일',
      isRead: true,
    ),
  ];

  static const _padding = EdgeInsets.symmetric(
    horizontal: AppBaseSizes.bodyHorizontal,
  );

  int _category = 0;

  Widget _divider() =>
      Divider(height: 0.5, thickness: 0.5, color: AppColors.neutral15);

  @override
  Widget build(BuildContext context) {
    final items = _category == 0
        ? _items
        : _items.where((e) => e.category == _categories[_category]).toList();

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
                  '알림',
                  style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
                ),
                actions: [
                  SvgIcon(
                    name: 'setting',
                    size: AppIconSizes.lg,
                    color: AppColors.neutral40,
                  ),
                ],
              ),
            ),
            if (items.isEmpty) Padding(padding: _padding, child: _divider()),
            SizedBox(height: 24),
            // 칩 목록은 오른쪽 화면 끝까지 스크롤되도록 오른쪽 패딩을 주지 않는다.
            AppChipList(
              data: _categories,
              selectedIndex: _category,
              onSelected: (i) => setState(() => _category = i),
              padding: EdgeInsets.only(left: AppBaseSizes.bodyHorizontal),
            ),
            SizedBox(height: 16),
            if (items.isNotEmpty) Padding(padding: _padding, child: _divider()),
            Expanded(
              child: items.isEmpty
                  ? _empty()
                  : ListView.separated(
                      padding: _padding.copyWith(top: 28, bottom: 20),
                      itemCount: items.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 36),
                      itemBuilder: (context, i) =>
                          NotificationTile(item: items[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _empty() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '새로운 알림이 없어요.',
          style: AppTextStyles.subtitle.copyWith(color: AppColors.neutral50),
        ),
        SizedBox(height: 4),
        Text(
          '커뮤니티에 글을 남겨보세요!',
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral40),
        ),
      ],
    ),
  );
}
