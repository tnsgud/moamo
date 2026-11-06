import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:moamo/shared/theme/app_colors.dart';

// 뼈대에서 빼거나(Skeleton.keep) 감출(Skeleton.ignore) 부분을 지정할 때 쓴다.
export 'package:skeletonizer/skeletonizer.dart' show Skeleton;

/// 로딩 중에는 [child]를 같은 모양의 회색 뼈대로 그린다.
///
/// [child]에는 실제 위젯에 가짜 데이터를 넣어 전달한다.
/// 글자가 비어 있으면 뼈대가 그려지지 않으니 적당한 길이의 문자열을 넣는다.
class AppSkeleton extends StatelessWidget {
  const AppSkeleton({super.key, this.enabled = true, required this.child});

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      effect: ShimmerEffect(
        baseColor: AppColors.neutral10,
        highlightColor: AppColors.neutral05,
      ),
      child: child,
    );
  }
}
