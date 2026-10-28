import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/auth/data/current_member_provider.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/banana_card.dart';
import 'widgets/my_stat_rows.dart';
import 'widgets/profile_header.dart';
import 'widgets/support_menu.dart';

class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  static String url = '/my';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nickname = ref.watch(currentMemberProvider).value?.nickname ?? '';

    return Column(
      children: [
        AppBar(
          leading: GestureDetector(
            onTap: () =>
                context.canPop() ? context.pop() : context.go('/library'),
            child: SvgIcon(name: 'back', size: AppIconSizes.lg),
          ),
          title: Text(
            '마이페이지',
            style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
          ),
          actions: [SvgIcon(name: 'setting', size: AppIconSizes.lg)],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                ProfileHeader(nickname: nickname),
                SizedBox(height: 24),
                BananaCard(count: 42),
                SizedBox(height: 24),
                Text(
                  '이번 달 독서 요약',
                  style: AppTextStyles.btn2.copyWith(
                    color: AppColors.neutral50,
                  ),
                ),
                SizedBox(height: 12),
                ReadingSummary(
                  stats: [('2권', '읽은 책'), ('42시간', '독서 시간'), ('6일', '연속 독서')],
                ),
                SizedBox(height: 24),
                MyShortcuts(labels: ['성장 그래프', '커뮤니티 관리', '친구 초대']),
                SizedBox(height: 32),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: AppColors.neutral15,
                ),
                SizedBox(height: 24),
                SupportMenu(
                  items: [
                    ('자주 찾는 질문', false),
                    ('1:1 문의', false),
                    ('공지사항', true),
                    ('약관 확인', false),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
