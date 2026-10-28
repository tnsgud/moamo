import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moamo/features/auth/data/current_member_provider.dart';
import 'package:moamo/features/guestbook/data/guestbook_provider.dart';
import 'package:moamo/features/guestbook/model/guestbook_entry.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/dimension/app_base_sizes.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_toast.dart';

import 'widgets/emoji_panel.dart';
import 'widgets/guestbook_app_bar.dart';
import 'widgets/guestbook_avatar.dart';
import 'widgets/guestbook_card.dart';
import 'widgets/guestbook_input_bar.dart';

/// 내 방명록. 다른 회원 방명록으로 들어가는 화면이 생기면 memberId를 받으면 된다.
class GuestbookScreen extends ConsumerWidget {
  const GuestbookScreen({super.key});

  static String url = '/guestbook';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(currentMemberProvider);

    return Scaffold(
      body: SafeArea(
        child: member.when(
          data: (m) => _Guestbook(memberId: m.memberId),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (_, _) => Center(
            child: GestureDetector(
              onTap: () => ref.invalidate(currentMemberProvider),
              child: Text(
                '방명록을 불러오지 못했어요. 탭해서 다시 시도',
                style: AppTextStyles.body2.copyWith(color: AppColors.neutral50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Guestbook extends ConsumerStatefulWidget {
  const _Guestbook({required this.memberId});

  final String memberId;

  @override
  ConsumerState<_Guestbook> createState() => _GuestbookState();
}

class _GuestbookState extends ConsumerState<_Guestbook> {
  static const _padding = EdgeInsets.symmetric(
    horizontal: AppBaseSizes.bodyHorizontal,
  );

  final _input = TextEditingController();
  bool _emojiOpen = false;
  bool _sending = false;

  /// 수정 중인 글 id. null이면 새 글 작성.
  String? _editingId;

  @override
  void initState() {
    super.initState();
    // 주인이 열면 안 읽은 글을 읽음 처리한다 (조회만으로는 읽음 처리되지 않음).
    ref.listenManual(guestbookProvider(widget.memberId), (_, next) {
      final book = next.value;
      if (book?.ownerView != true) return;
      final unread = [
        for (final e in book?.entries ?? <GuestbookEntryResponse>[])
          if (e.unread == true) e.id,
      ];
      if (unread.isNotEmpty) {
        ref
            .read(guestbookProvider(widget.memberId).notifier)
            .markRead(unread)
            .ignore();
      }
    }, fireImmediately: true);
  }

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  Guestbook get _notifier =>
      ref.read(guestbookProvider(widget.memberId).notifier);

  Future<void> _send() async {
    final content = _input.text.trim();
    if (content.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      final editingId = _editingId;
      if (editingId == null) {
        await _notifier.add(content: content);
      } else {
        await _notifier.edit(editingId, content: content);
      }
      _input.clear();
      _editingId = null;
    } catch (_) {
      if (mounted) showAppToast(context, '방명록을 남기지 못했어요.', isError: true);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _delete(String entryId) async {
    try {
      await _notifier.delete(entryId);
    } catch (_) {
      if (mounted) showAppToast(context, '방명록을 삭제하지 못했어요.', isError: true);
    }
  }

  static String _date(DateTime? d) {
    if (d == null) return '';
    final l = d.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(l.month)}월 ${two(l.day)}일';
  }

  @override
  Widget build(BuildContext context) {
    final book = ref.watch(guestbookProvider(widget.memberId)).value;
    // 서버는 최신순. 채팅처럼 오래된 글이 위로 오게 뒤집는다.
    final entries = (book?.entries ?? []).reversed.toList();

    bool showAvatar(int i) =>
        entries[i].ownerEntry != true &&
        (i == 0 || entries[i - 1].authorMemberId != entries[i].authorMemberId);

    return Column(
      children: [
        Padding(
          padding: _padding,
          child: GuestbookAppBar(
            title: '${book?.ownerNickname ?? ''}의 방명록',
            count: book?.totalEntries ?? 0,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: _padding.copyWith(top: 20, bottom: 20),
            itemCount: entries.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemBuilder: (context, i) {
              final e = entries[i];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: GuestbookAvatar.size + 10,
                    child: showAvatar(i) ? GuestbookAvatar() : null,
                  ),
                  Expanded(
                    child: GuestbookCard(
                      entry: GuestbookEntry(
                        name: e.authorNickname,
                        date: _date(e.createdAt),
                        content: e.content ?? '',
                        isMine: e.ownerEntry == true,
                        isNew: e.unread == true,
                        canEdit: e.canEdit == true,
                        canDelete: e.canDelete == true,
                      ),
                      onDelete: () => _delete(e.id),
                      onEdit: () => setState(() {
                        _editingId = e.id;
                        _input.text = e.content ?? '';
                      }),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        if (_emojiOpen) EmojiPanel(),
        Divider(height: 0.5, thickness: 0.5, color: AppColors.neutral15),
        Padding(
          padding: _padding.copyWith(top: 16, bottom: 16),
          child: GuestbookInputBar(
            controller: _input,
            emojiOpen: _emojiOpen,
            onEmojiTap: () => setState(() => _emojiOpen = !_emojiOpen),
            onSend: _send,
          ),
        ),
      ],
    );
  }
}
