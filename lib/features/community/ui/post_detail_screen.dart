import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/community/model/post_comment.dart';
import 'package:moamo/features/guestbook/ui/widgets/emoji_panel.dart';
import 'package:moamo/features/guestbook/ui/widgets/guestbook_avatar.dart';
import 'package:moamo/features/guestbook/ui/widgets/guestbook_input_bar.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

import 'widgets/comment_tile.dart';
import 'widgets/post_navigator_card.dart';
import 'widgets/post_stats_bar.dart';
import 'widgets/section_title.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key, required this.postId});

  final int postId;

  static String url = '/community/post/:id';

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  // TODO: postId로 게시물을 조회하도록 교체
  static const _boardName = '아몬드';
  static const _author = '뫄뫄좌';
  static const _date = '26/08/11 14:30';
  static const _title = '윤재는 정말 행복했을까?';
  static const _content =
      '아몬드 읽으면서 궁금했던 게 있는데,\n'
      '윤재는 마지막에 정말 행복해졌다고 볼 수 있을까요? ㅠㅠ\n'
      '처음에는 감정을 느끼지 못했던 윤재가 곤이와 장례를 만나면서 조금씩 변해가는 모습이 인상적이었는데, 다른분들은 어때요?';

  final List<PostComment> _comments = [
    PostComment(
      author: '히요',
      date: '26/08/12 13:00',
      content:
          '저는 아직 완전히 행복해졌다고 보기는 어려운 것 같아요..!\n감정을 느끼고 표현하는 법을 배워가는 과정에 있는 게 아닐까요?',
      replies: [
        PostComment(
          author: '뫄뫄좌',
          date: '26/08/11 15:30',
          content: '맞아요! 저도 윤재가 조금씩 행복을 알아간 것 같아요 😊',
          likes: 1,
          isLiked: true,
        ),
        PostComment(
          author: '뫄뫄좌',
          date: '26/08/11 15:30',
          content: '맞아요! 저도 윤재가 조금씩 행복을 알아간 것 같아요 😊',
          hasSticker: true,
        ),
      ],
    ),
    PostComment(
      author: '히요',
      date: '26/08/12 13:00',
      content:
          '저는 아직 완전히 행복해졌다고 보기는 어려운 것 같아요..!\n감정을 느끼고 표현하는 법을 배워가는 과정에 있는 게 아닐까요?',
    ),
  ];

  final _input = TextEditingController();

  bool _isLiked = false;
  int _likes = 3;
  bool _isScrapped = false;
  bool _emojiOpen = false;
  // TODO: 이모티콘 이미지가 준비되면 선택한 이모티콘 id로 교체
  int? _sticker;

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  int get _commentCount =>
      _comments.fold(0, (sum, c) => sum + 1 + c.replies.length);

  void _send() {
    final text = _input.text.trim();
    if (text.isEmpty && _sticker == null) return;

    setState(() {
      _comments.add(
        PostComment(
          author: '나',
          date: '방금',
          content: text,
          hasSticker: _sticker != null,
        ),
      );
      _input.clear();
      _sticker = null;
      _emojiOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        _appBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                _writer(),
                SizedBox(height: 16),
                Text(
                  _title,
                  style: AppTextStyles.btn1.copyWith(
                    color: AppColors.neutral90,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _content,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.neutral90,
                  ),
                ),
                SizedBox(height: 32),
                PostStatsBar(
                  likes: _likes,
                  isLiked: _isLiked,
                  comments: _commentCount,
                  isScrapped: _isScrapped,
                  onLike: () => setState(() {
                    _isLiked = !_isLiked;
                    _likes += _isLiked ? 1 : -1;
                  }),
                  onScrap: () => setState(() => _isScrapped = !_isScrapped),
                ),
                SizedBox(height: 16),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: AppColors.neutral15,
                ),
                if (_comments.isEmpty) _emptyComments() else _commentList(),
                SizedBox(height: 24),
                PostNavigatorCard(
                  previousTitle: '불의 잔도 재밌나요?\n재밌냐구요!',
                  nextTitle: '해리포터 시리즈\n추천구다사이!',
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        if (_sticker != null) _stickerPreview(),
        if (_emojiOpen)
          // 이모티콘 패널은 화면 좌우 끝까지 채운다.
          SizedBox(
            height: 300,
            child: OverflowBox(
              minWidth: screenWidth,
              maxWidth: screenWidth,
              child: EmojiPanel(
                onSelected: (i) => setState(() => _sticker = i),
              ),
            ),
          ),
        Divider(height: 0.5, thickness: 0.5, color: AppColors.neutral15),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: GuestbookInputBar(
            controller: _input,
            hintText: '바른 말 고운 말',
            emojiOpen: _emojiOpen,
            onEmojiTap: () => setState(() => _emojiOpen = !_emojiOpen),
            onSend: _send,
          ),
        ),
      ],
    );
  }

  Widget _appBar() => AppBar(
    toolbarHeight: 64,
    leading: GestureDetector(
      onTap: () => context.pop(),
      child: SvgIcon(name: 'back', size: AppIconSizes.lg),
    ),
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '게시물',
          style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
        ),
        Text(
          _boardName,
          style: AppTextStyles.caption1.copyWith(color: AppColors.neutral40),
        ),
      ],
    ),
    actions: [
      SvgIcon(name: 'notice_none', size: AppIconSizes.lg),
      SizedBox(width: 10),
      PopupMenuButton<String>(
        position: PopupMenuPosition.under,
        padding: EdgeInsets.zero,
        color: AppColors.neutral05,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
        onSelected: (value) {
          if (value == 'copy') {
            Clipboard.setData(
              ClipboardData(text: '/community/post/${widget.postId}'),
            );
            showAppToast(context, 'url이 복사되었습니다.');
          }
        },
        itemBuilder: (context) => [
          for (final (value, label) in [
            ('report', '신고'),
            ('block', '차단'),
            ('copy', 'url 복사'),
          ])
            PopupMenuItem(
              value: value,
              child: Text(
                label,
                style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
              ),
            ),
        ],
        child: SvgIcon(name: 'kebab', size: AppIconSizes.lg),
      ),
    ],
  );

  Widget _writer() => Row(
    children: [
      GuestbookAvatar(),
      SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _author,
            style: AppTextStyles.btn1.copyWith(color: AppColors.neutral90),
          ),
          Text(
            _date,
            style: AppTextStyles.body1.copyWith(color: AppColors.neutral50),
          ),
        ],
      ),
    ],
  );

  Widget _commentList() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 24),
      SectionTitle('댓글 $_commentCount'),
      SizedBox(height: 16),
      for (var i = 0; i < _comments.length; i++) ...[
        if (i > 0) ...[
          SizedBox(height: 20),
          Divider(height: 0.5, thickness: 0.5, color: AppColors.neutral15),
          SizedBox(height: 20),
        ],
        CommentTile(comment: _comments[i]),
      ],
    ],
  );

  Widget _emptyComments() => Padding(
    padding: EdgeInsets.symmetric(vertical: 100),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '댓글이 아직 없습니다.',
            style: AppTextStyles.subtitle.copyWith(color: AppColors.neutral40),
          ),
          SizedBox(height: 4),
          Text(
            '첫 댓글의 주인공이 되어보세요!',
            style: AppTextStyles.caption1.copyWith(color: AppColors.neutral40),
          ),
        ],
      ),
    ),
  );

  Widget _stickerPreview() => Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(bottom: 8),
      // TODO: 선택한 이모티콘 이미지로 교체
      child: Container(
        width: 140,
        height: 100,
        padding: EdgeInsets.all(8),
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
          color: AppColors.neutral50,
          borderRadius: AppRadius.xl,
        ),
        child: GestureDetector(
          onTap: () => setState(() => _sticker = null),
          child: SvgIcon(
            name: 'X',
            size: AppIconSizes.sm,
            color: AppColors.neutral0,
          ),
        ),
      ),
    ),
  );
}
