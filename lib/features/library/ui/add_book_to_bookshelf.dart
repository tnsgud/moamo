import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:moamo/features/library/data/my_bookshelves_provider.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/widget/app_toast.dart';

/// [bookshelfId] 책장에 ISBN으로 책을 담고 결과를 토스트로 알린다. 성공하면 true.
Future<bool> addBookToBookshelf(
  BuildContext context,
  WidgetRef ref, {
  required String bookshelfId,
  String shelfName = '책장',
  required String isbn,
}) async {
  try {
    await ref.read(bookshelfBooksProvider(bookshelfId).notifier).add(isbn);
    if (context.mounted) showAppToast(context, '$shelfName에 담았어요.');
    return true;
  } on DioException catch (e) {
    if (context.mounted) {
      showAppToast(
        context,
        e.response?.statusCode == 409
            ? '이미 $shelfName에 있는 책이에요.'
            : '책을 담지 못했어요.',
        isError: true,
      );
    }
    return false;
  }
}

/// 담을 책장을 고르는 다이얼로그. 책장이 없거나 취소하면 null.
// TODO: 디자인이 나오면 교체
Future<BookshelfResponse?> pickBookshelf(
  BuildContext context,
  WidgetRef ref,
) async {
  final List<BookshelfResponse> shelves;
  try {
    shelves = await ref.read(myBookshelvesProvider.future);
  } catch (_) {
    if (context.mounted) {
      showAppToast(context, '책장을 불러오지 못했어요.', isError: true);
    }
    return null;
  }
  if (!context.mounted) return null;
  if (shelves.isEmpty) {
    showAppToast(context, '먼저 책장을 만들어 주세요.', isError: true);
    return null;
  }
  return showDialog<BookshelfResponse>(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text('어느 책장에 담을까요?'),
      children: [
        for (final s in shelves)
          SimpleDialogOption(
            onPressed: () => context.pop(s),
            child: Text(s.name),
          ),
      ],
    ),
  );
}
