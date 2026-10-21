import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moamo/shared/dimension/app_icon_sizes.dart';
import 'package:moamo/shared/dimension/app_radius.dart';
import 'package:moamo/shared/theme/app_colors.dart';
import 'package:moamo/shared/theme/app_text_styles.dart';
import 'package:moamo/shared/widget/app_toast.dart';
import 'package:moamo/shared/widget/svg_icon.dart';

class PostWriteScreen extends StatefulWidget {
  const PostWriteScreen({
    super.key,
    this.title = '게시물',
    this.categories = const ['책 후기', '질문', '의견토론'],
    this.saveIcon = 'success',
  });

  static String bookUrl = '/community/book/:id/write';
  static String freeUrl = '/community/free/write';

  final String title;
  final List<String> categories;
  final String saveIcon;

  @override
  State<PostWriteScreen> createState() => _PostWriteScreenState();
}

class _PostWriteScreenState extends State<PostWriteScreen> {
  List<String> get _categories => widget.categories;

  static const _rules = [
    '모아모는 누구나 사용할 수 있어요.',
    '욕설은 금지에요.',
    '다른 사용자를 존중해주세요.',
    '신고 먹을 수 있습니다.',
  ];

  final _title = TextEditingController();
  final _content = TextEditingController();
  final _contentFocus = FocusNode();

  int _category = 0;
  // TODO: image_picker 연동 시 선택한 이미지로 교체
  int _imageCount = 0;

  @override
  void initState() {
    super.initState();
    _content.addListener(() => setState(() {}));
    _contentFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _title.dispose();
    _content.dispose();
    _contentFocus.dispose();
    super.dispose();
  }

  void _save() {
    if (_title.text.trim().isEmpty || _content.text.trim().isEmpty) {
      showAppToast(context, '모든 칸이 작성되지 않았습니다.', isError: true);
      return;
    }
    context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final showGuide = !_contentFocus.hasFocus && _content.text.isEmpty;

    return Column(
      children: [
        AppBar(
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: SvgIcon(name: 'back', size: AppIconSizes.lg),
          ),
          title: Text(
            widget.title,
            style: AppTextStyles.h3.copyWith(color: AppColors.neutral90),
          ),
          actions: [
            GestureDetector(
              onTap: _save,
              child: SvgIcon(name: widget.saveIcon, size: AppIconSizes.lg),
            ),
          ],
        ),
        _titleField(),
        SizedBox(height: 12),
        Row(
          children: [
            for (var i = 0; i < _categories.length; i++) ...[
              if (i > 0) SizedBox(width: 8),
              Expanded(child: _categoryButton(i)),
            ],
          ],
        ),
        SizedBox(height: 12),
        Expanded(child: _contentBox(showGuide)),
        SizedBox(height: 12),
        Row(
          children: [
            GestureDetector(
              onTap: () => setState(() => _imageCount++),
              child: _imageSlot(
                child: SvgIcon(
                  name: 'camera',
                  size: AppIconSizes.lg,
                  color: AppColors.neutral40,
                ),
              ),
            ),
            for (var i = 0; i < _imageCount; i++) ...[
              SizedBox(width: 12),
              // TODO: 선택한 이미지로 교체
              _imageSlot(color: AppColors.neutral05),
            ],
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _titleField() => Container(
    height: 48,
    padding: EdgeInsets.symmetric(horizontal: 20),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.neutral15),
      borderRadius: AppRadius.round,
    ),
    child: TextField(
      controller: _title,
      cursorColor: AppColors.neutral50,
      style: AppTextStyles.subtitle.copyWith(color: AppColors.neutral90),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        hintText: '제목',
        hintStyle: AppTextStyles.subtitle.copyWith(color: AppColors.neutral40),
        border: InputBorder.none,
      ),
    ),
  );

  Widget _categoryButton(int index) {
    final selected = index == _category;

    return GestureDetector(
      onTap: () => setState(() => _category = index),
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary08 : AppColors.neutral05,
          border: selected ? Border.all(color: AppColors.primary) : null,
          borderRadius: AppRadius.sm,
        ),
        child: Center(
          child: Text(
            _categories[index],
            style: selected
                ? AppTextStyles.btn2Bold.copyWith(color: AppColors.neutral90)
                : AppTextStyles.btn2.copyWith(color: AppColors.neutral40),
          ),
        ),
      ),
    );
  }

  Widget _contentBox(bool showGuide) => Container(
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
            focusNode: _contentFocus,
            maxLines: null,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            cursorColor: AppColors.neutral50,
            style: AppTextStyles.subtitle.copyWith(color: AppColors.neutral90),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: _contentFocus.hasFocus ? null : '내용을 입력하세요',
              hintStyle: AppTextStyles.subtitle.copyWith(
                color: AppColors.neutral40,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        if (showGuide) _guide(),
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
            '커뮤니티 이용수칙',
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
            for (final rule in _rules)
              Text(
                '•  $rule',
                style: AppTextStyles.body2.copyWith(color: AppColors.neutral50),
              ),
          ],
        ),
      ),
    ],
  );

  Widget _imageSlot({Widget? child, Color? color}) => Container(
    width: 64,
    height: 64,
    decoration: BoxDecoration(
      color: color,
      border: color == null ? Border.all(color: AppColors.neutral15) : null,
      borderRadius: AppRadius.lg,
    ),
    child: Center(child: child),
  );
}
