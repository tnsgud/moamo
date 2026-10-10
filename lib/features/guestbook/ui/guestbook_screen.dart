import 'package:flutter/material.dart';
import 'package:moamo/features/guestbook/model/guestbook_entry.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';

import 'widgets/emoji_panel.dart';
import 'widgets/guestbook_app_bar.dart';
import 'widgets/guestbook_avatar.dart';
import 'widgets/guestbook_card.dart';
import 'widgets/guestbook_input_bar.dart';

class GuestbookScreen extends StatefulWidget {
  const GuestbookScreen({super.key});

  @override
  State<GuestbookScreen> createState() => _GuestbookScreenState();
}

class _GuestbookScreenState extends State<GuestbookScreen> {
  static const _entries = [
    GuestbookEntry(name: '방문자 A', date: '08월 19일', content: '안녕하세요, 방명록입니다.'),
    GuestbookEntry(name: '방문자 A', date: '08월 20일', content: '안녕하세요, 신성록입니다.'),
    GuestbookEntry(
      name: '누군가',
      date: '08월 20일',
      content: '안녕하세요, 최강록입니다.',
      isMine: true,
    ),
    GuestbookEntry(
      name: '방문자 B',
      date: '08월 21일',
      content: '안녕하세요, 콜록콜록입니다.',
      isNew: true,
    ),
  ];

  static const _padding = EdgeInsets.symmetric(
    horizontal: AppBaseSizes.bodyHorizontal,
  );

  bool _emojiOpen = false;

  bool _showAvatar(int i) =>
      !_entries[i].isMine &&
      (i == 0 || _entries[i - 1].name != _entries[i].name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: _padding,
              child: GuestbookAppBar(title: '누군가의 방명록', count: _entries.length),
            ),
            Expanded(
              child: ListView.separated(
                padding: _padding.copyWith(top: 20, bottom: 20),
                itemCount: _entries.length,
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemBuilder: (context, i) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: GuestbookAvatar.size + 10,
                      child: _showAvatar(i) ? GuestbookAvatar() : null,
                    ),
                    Expanded(child: GuestbookCard(entry: _entries[i])),
                  ],
                ),
              ),
            ),
            if (_emojiOpen) EmojiPanel(),
            Divider(height: 0.5, thickness: 0.5, color: AppColors.neutral15),
            Padding(
              padding: _padding.copyWith(top: 16, bottom: 16),
              child: GuestbookInputBar(
                emojiOpen: _emojiOpen,
                onEmojiTap: () => setState(() => _emojiOpen = !_emojiOpen),
                onSend: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
