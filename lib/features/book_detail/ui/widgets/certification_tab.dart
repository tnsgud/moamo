import 'package:flutter/material.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';

class CertificationTab extends StatelessWidget {
  const CertificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _MainCard(label: 'AI 카메라 인증', isCertified: true)),
            SizedBox(width: 8),
            Expanded(child: _MainCard(label: '독후감 작성', isCertified: false)),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _SubCard(label: '간단 기록')),
            SizedBox(width: 8),
            Expanded(child: _SubCard(label: '최근 인증 기록')),
          ],
        ),
      ],
    );
  }
}

BoxDecoration _cardDecoration(bool highlighted) => BoxDecoration(
  color: highlighted ? AppColors.primary08 : AppColors.neutral05,
  border: Border.all(
    color: highlighted ? AppColors.primary : AppColors.neutral15,
  ),
  borderRadius: AppRadius.md,
);

class _MainCard extends StatelessWidget {
  const _MainCard({required this.label, required this.isCertified});

  final String label;
  final bool isCertified;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      decoration: _cardDecoration(isCertified),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // TODO: 캐릭터 이미지가 준비되면 교체
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.profile,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  label,
                  style: AppTextStyles.btn2.copyWith(
                    color: const Color.fromARGB(255, 15, 5, 5),
                  ),
                ),
              ],
            ),
          ),
          if (isCertified) Positioned(top: 0, right: 16, child: _Ribbon()),
        ],
      ),
    );
  }
}

class _SubCard extends StatelessWidget {
  const _SubCard({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: _cardDecoration(false),
      child: Center(
        child: Text(
          label,
          style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
        ),
      ),
    );
  }
}

class _Ribbon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _RibbonClipper(),
      child: Container(
        width: 25,
        height: 34,
        padding: EdgeInsets.only(top: 6),
        color: AppColors.secondary100,
        alignment: Alignment.topCenter,
        child: Text(
          '인증',
          style: AppTextStyles.caption2.copyWith(color: AppColors.neutral0),
        ),
      ),
    );
  }
}

class _RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..lineTo(0, size.height)
    ..lineTo(size.width / 2, size.height - 8)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
