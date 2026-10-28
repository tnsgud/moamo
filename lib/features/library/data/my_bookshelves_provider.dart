import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:moamo/features/bookcase_decorate/model/bookshelf_template.dart';
import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/network/api_client.dart';

part 'my_bookshelves_provider.g.dart';

/// 내 책장 목록 (생성 시각 최신순). 책장이 없으면 빈 리스트.
@riverpod
class MyBookshelves extends _$MyBookshelves {
  @override
  Future<List<BookshelfResponse>> build() async {
    final res = await apiClient.bookshelf.getMyBookshelves();
    return res.data;
  }

  /// 기본 템플릿을 적용한 빈 책장을 만들고 생성된 책장을 돌려준다.
  Future<BookshelfResponse> create(String name) async {
    final res = await apiClient.bookshelf.createMyBookshelf(
      body: BookshelfCreateRequest(
        name: name,
        templateKey: bookshelfTemplates.first.$1,
      ),
    );
    ref.invalidateSelf();
    return res.data;
  }

  Future<void> delete(String bookshelfId) async {
    await apiClient.bookshelf.deleteMyBookshelf(bookshelfId: bookshelfId);
    ref.invalidateSelf();
  }
}

/// 책장 한 개의 요약(이름·책 수·템플릿·색상).
@riverpod
Future<BookshelfResponse> bookshelf(Ref ref, String bookshelfId) async {
  final res = await apiClient.bookshelf.getMyBookshelf(
    bookshelfId: bookshelfId,
  );
  return res.data;
}

/// 책장 안의 책 한 권 상세. [bookId]는 ISBN이 아니라 `book.id`.
@riverpod
Future<BookshelfBookResponse> bookshelfBook(
  Ref ref,
  String bookshelfId,
  String bookId,
) async {
  final res = await apiClient.bookshelf.getBookInMyBookshelf(
    bookshelfId: bookshelfId,
    bookId: bookId,
  );
  return res.data;
}

/// 책장 안의 책 목록.
@riverpod
class BookshelfBooks extends _$BookshelfBooks {
  @override
  Future<List<BookshelfBookResponse>> build(String bookshelfId) async {
    final res = await apiClient.bookshelf.getBooksInMyBookshelf(
      bookshelfId: bookshelfId,
    );
    return res.data;
  }

  /// 검색 결과의 ISBN으로 책을 담는다. 같은 책장에 이미 있으면 409.
  Future<void> add(String isbn) async {
    await apiClient.bookshelf.addBookToMyBookshelf(
      bookshelfId: bookshelfId,
      body: BookshelfAddRequest(isbn: isbn),
    );
    _invalidate();
  }

  /// [bookId]는 ISBN이 아니라 `book.id`.
  Future<void> remove(String bookId) async {
    await apiClient.bookshelf.removeBookFromMyBookshelf(
      bookshelfId: bookshelfId,
      bookId: bookId,
    );
    _invalidate();
  }

  // 책 수가 바뀌므로 책장 요약·목록도 다시 불러온다.
  // 책을 빼면 서버가 미리보기 배치에서도 빼므로 꾸미기도 다시 불러온다.
  void _invalidate() {
    ref.invalidateSelf();
    ref.invalidate(bookshelfDecorationProvider(bookshelfId));
    ref.invalidate(bookshelfProvider(bookshelfId));
    ref.invalidate(myBookshelvesProvider);
  }
}

/// 내 모든 책장의 책 (같은 책은 한 번만).
@riverpod
Future<List<BookResponse>> myLibraryBooks(Ref ref) async {
  final shelves = await ref.watch(myBookshelvesProvider.future);
  final lists = await Future.wait([
    for (final s in shelves) ref.watch(bookshelfBooksProvider(s.id).future),
  ]);
  final seen = <String>{};
  return [
    for (final list in lists)
      for (final b in list)
        if (seen.add(b.book.id)) b.book,
  ];
}

/// 책장 꾸미기(이름·템플릿·표지 색상·미리보기 배치).
@riverpod
class BookshelfDecoration extends _$BookshelfDecoration {
  @override
  Future<BookshelfDecorationResponse> build(String bookshelfId) async {
    final res = await apiClient.bookshelf.getMyBookshelfDecoration(
      bookshelfId: bookshelfId,
    );
    return res.data;
  }

  Future<void> save(BookshelfDecorationRequest body) async {
    final res = await apiClient.bookshelf.saveMyBookshelfDecoration(
      bookshelfId: bookshelfId,
      body: body,
    );
    state = AsyncData(res.data);
    ref.invalidate(bookshelfProvider(bookshelfId));
    ref.invalidate(myBookshelvesProvider);
  }
}
