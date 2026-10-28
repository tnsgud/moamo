import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/features/book_detail/data/book_memos_provider.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_dialog.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class BookMemoScreen extends ConsumerStatefulWidget {
  const BookMemoScreen({
    super.key,
    required this.bookshelfId,
    required this.bookId,
    this.memoId,
  });

  final String bookshelfId;
  final String bookId;

  /// 있으면 수정, 없으면 새로 작성.
  final String? memoId;
  static String url = '/bookshelf/:bookshelfId/book/:bookId/memo';

  @override
  ConsumerState<BookMemoScreen> createState() => _BookMemoScreenState();
}

class _BookMemoScreenState extends ConsumerState<BookMemoScreen> {
  static const _guides = [
    '책을 보면서 느꼈던 감상을 적어보세요.',
    '비공개로 설정하면 다른 사람에게 메모가 공개되지 않아요.',
    '다른 사용자를 존중해주세요',
    '감명 깊었던 글귀나 인상 깊었던 문장을 사진으로 추가해 보세요.',
  ];

  bool _isPrivate = false;
  // TODO: image_picker 연동 시 선택한 이미지로 교체
  bool _hasImage = false;
  bool _saving = false;
  final _content = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 수정이면 상세 화면에서 받아 둔 메모 목록에서 꺼내 채운다.
    final memo = ref
        .read(bookMemosProvider(widget.bookshelfId, widget.bookId))
        .value
        ?.where((m) => m.id == widget.memoId)
        .firstOrNull;
    if (memo != null) {
      _content.text = memo.content ?? '';
      _isPrivate = memo.visibility == BookMemoVisibility.private;
    }
  }

  @override
  void dispose() {
    _content.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final content = _content.text.trim();
    // ponytail: 사진 업로드는 image_picker 연동 후. 지금은 글만 저장한다.
    if (content.isEmpty) {
      showAppToast(context, '내용을 입력해 주세요.', isError: true);
      return;
    }
    final memos = ref.read(
      bookMemosProvider(widget.bookshelfId, widget.bookId).notifier,
    );
    final visibility = _isPrivate
        ? BookMemoVisibility.private
        : BookMemoVisibility.public;

    setState(() => _saving = true);
    try {
      final memoId = widget.memoId;
      if (memoId == null) {
        await memos.create(content: content, visibility: visibility);
      } else {
        await memos.edit(memoId, content: content, visibility: visibility);
      }
    } catch (_) {
      if (mounted) showAppToast(context, '메모를 저장하지 못했어요.', isError: true);
      return;
    } finally {
      if (mounted) setState(() => _saving = false);
    }
    if (!mounted) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AppDialog(
        icon: SvgIcon(
          name: 'success',
          size: AppIconSizes.md,
          color: AppColors.primary,
        ),
        title: '저장 완료!',
        description: '메모 저장이 완료되었습니다.\n변경 사항이 정상적으로 반영되었습니다.',
        actions: [
          AppDialogAction(
            label: '확인',
            onTap: () {
              dialogContext.pop();
              context.pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: SvgIcon(name: 'back', size: AppIconSizes.lg),
          ),
          title: Text(
            '메모',
            style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
          ),
          actions: [
            GestureDetector(
              onTap: _saving ? null : _save,
              child: SvgIcon(name: 'success', size: AppIconSizes.lg),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _imageButton(),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () => setState(() => _isPrivate = !_isPrivate),
              child: _chip(
                icon: _isPrivate ? 'checkbox_active' : 'checkbox',
                label: '비공개 글',
                isActive: _isPrivate,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral15),
              borderRadius: AppRadius.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: _content,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    cursorColor: AppColors.neutral50,
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.neutral90,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: '내용을 입력하세요',
                      hintStyle: AppTextStyles.body1.copyWith(
                        color: AppColors.neutral40,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (_hasImage)
                  // TODO: 선택한 이미지로 교체
                  Container(
                    width: 125,
                    height: 116,
                    decoration: BoxDecoration(
                      color: AppColors.neutral50,
                      borderRadius: AppRadius.xs,
                    ),
                  )
                else
                  _guide(),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _imageButton() => PopupMenuButton<String>(
    position: PopupMenuPosition.under,
    color: AppColors.neutral05,
    shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
    padding: EdgeInsets.zero,
    onSelected: (_) => setState(() => _hasImage = true),
    itemBuilder: (context) => [
      _menuItem(
        'gallery',
        '사진 보관함',
        SvgIcon(name: 'picture', size: AppIconSizes.md),
      ),
      _menuItem(
        'camera',
        '사진 찍기',
        SvgIcon(name: 'camera', size: AppIconSizes.md),
      ),
      _menuItem(
        'file',
        '파일 선택',
        Icon(Icons.filter_none_rounded, size: AppIconSizes.sm),
      ),
    ],
    child: _chip(icon: 'camera', label: '이미지 추가', isActive: true),
  );

  PopupMenuItem<String> _menuItem(String value, String label, Widget icon) =>
      PopupMenuItem(
        value: value,
        child: Row(
          children: [
            icon,
            SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.btn2.copyWith(color: AppColors.neutral90),
            ),
          ],
        ),
      );

  Widget _chip({
    required String icon,
    required String label,
    required bool isActive,
  }) => Container(
    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
    decoration: BoxDecoration(
      color: isActive ? AppColors.primary : AppColors.neutral10,
      borderRadius: AppRadius.sm,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgIcon(
          name: icon,
          size: AppIconSizes.lg,
          color: isActive ? AppColors.neutral90 : AppColors.neutral40,
        ),
        SizedBox(width: 6),
        Text(
          label,
          style: AppTextStyles.btn3.copyWith(
            color: isActive ? AppColors.neutral90 : AppColors.neutral40,
          ),
        ),
      ],
    ),
  );

  Widget _guide() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SvgIcon(name: 'info_none', size: AppIconSizes.sm),
          SizedBox(width: 6),
          Text(
            '간단 메모 가이드',
            style: AppTextStyles.body2.copyWith(color: AppColors.neutral40),
          ),
        ],
      ),
      SizedBox(height: 8),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.neutral05,
          borderRadius: AppRadius.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final guide in _guides)
              Text(
                '•  $guide',
                style: AppTextStyles.body2.copyWith(color: AppColors.neutral50),
              ),
          ],
        ),
      ),
    ],
  );
}
