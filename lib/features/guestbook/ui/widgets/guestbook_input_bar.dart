import 'package:flutter/material.dart';
import 'package:moamo/features/guestbook/ui/widgets/guestbook_avatar.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_button.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class GuestbookInputBar extends StatelessWidget {
  const GuestbookInputBar({
    super.key,
    required this.emojiOpen,
    required this.onEmojiTap,
    required this.onSend,
    this.hintText = '방문자들에게 인사해 보세요.',
  });

  final bool emojiOpen;
  final VoidCallback onEmojiTap;
  final VoidCallback onSend;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GuestbookAvatar(),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 46,
            padding: EdgeInsets.only(left: 20, right: 12),
            decoration: BoxDecoration(
              color: AppColors.neutral05,
              borderRadius: AppRadius.round,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.neutral60,
                    ),
                    cursorColor: AppColors.neutral50,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: hintText,
                      hintStyle: AppTextStyles.body1.copyWith(
                        color: AppColors.neutral40,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onEmojiTap,
                  child: SvgIcon(
                    name: emojiOpen ? 'emotion_active' : 'emotion_none',
                    size: AppIconSizes.lg,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        AppButton(
          onTap: onSend,
          padding: EdgeInsets.all(12),
          child: SvgIcon(name: 'send', size: AppIconSizes.lg),
        ),
      ],
    );
  }
}
