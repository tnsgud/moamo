import 'package:moamo/shared/api/export.dart';
import 'package:moamo/shared/network/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_search_provider.g.dart';

@riverpod
Future<BookPageResponse> bookSearch(Ref ref, String keyword) async {
  final res = await apiClient.books.searchBooks(query: keyword);
  return res.data;
}

@riverpod
Future<List<BookMetadata>> bookRecommendations(
  Ref ref,
  String isbn, {
  BookRecommendationType? type,
}) async {
  final res = await apiClient.books.getRelatedBooks(isbn: isbn, type: type);
  return res.data;
}

/// 공공도서관 대출 통계 기준 인기 도서 (최근 3개월).
@riverpod
Future<List<BookMetadata>> popularBooks(Ref ref) async {
  final res = await apiClient.books.getPopularBooks(size: 10);
  return res.data.books;
}

/// 책장에 담기 전 책 정보 (ISBN으로 외부 제공처 조회, DB 저장 안 함).
@riverpod
Future<BookMetadata> externalBook(Ref ref, String isbn) async {
  final res = await apiClient.books.getExternalBookByIsbn(isbn: isbn);
  return res.data;
}
