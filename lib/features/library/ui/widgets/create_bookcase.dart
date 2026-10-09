import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_button.dart';

class CreateBookcase extends StatelessWidget {
  const CreateBookcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(21),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral15, width: 0.5),
        borderRadius: AppRadius.lg,
        color: AppColors.neutral0,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 10,
            color: AppColors.neutral90.withValues(alpha: 0.06),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '첫 책장 만들기',
            style: AppTextStyles.caption1Bold.copyWith(
              color: AppColors.neutral90,
            ),
          ),
          AppButton(
            onTap: () => context.push('/bookcase/new'),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text('책 추가하기'),
            ),
          ),
        ],
      ),
    );
  }
}
