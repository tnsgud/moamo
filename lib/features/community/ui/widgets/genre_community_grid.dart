import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

import 'section_title.dart';

class GenreCommunityGrid extends StatelessWidget {
  const GenreCommunityGrid({super.key, required this.genres});

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('장르별 커뮤니티'),
        SizedBox(height: 4),
        Text(
          '다양한 장르의 커뮤니티를 구경해보세요!',
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral50),
        ),
        SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 120,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [for (final genre in genres) _GenreCard(label: genre)],
        ),
      ],
    );
  }
}

class _GenreCard extends StatelessWidget {
  const _GenreCard({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral05,
        borderRadius: AppRadius.xxl,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO: 장르 일러스트로 교체
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.profile,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.btn2Bold.copyWith(color: AppColors.neutral90),
          ),
        ],
      ),
    );
  }
}
