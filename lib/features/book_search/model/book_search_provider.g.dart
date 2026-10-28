// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookSearch)
final bookSearchProvider = BookSearchFamily._();

final class BookSearchProvider
    extends
        $FunctionalProvider<
          AsyncValue<BookPageResponse>,
          BookPageResponse,
          FutureOr<BookPageResponse>
        >
    with $FutureModifier<BookPageResponse>, $FutureProvider<BookPageResponse> {
  BookSearchProvider._({
    required BookSearchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookSearchHash();

  @override
  String toString() {
    return r'bookSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<BookPageResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BookPageResponse> create(Ref ref) {
    final argument = this.argument as String;
    return bookSearch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookSearchHash() => r'0e843cc8750ca0e18e1751b09b846be73457bf3f';

final class BookSearchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<BookPageResponse>, String> {
  BookSearchFamily._()
    : super(
        retry: null,
        name: r'bookSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookSearchProvider call(String keyword) =>
      BookSearchProvider._(argument: keyword, from: this);

  @override
  String toString() => r'bookSearchProvider';
}

@ProviderFor(bookRecommendations)
final bookRecommendationsProvider = BookRecommendationsFamily._();

final class BookRecommendationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookMetadata>>,
          List<BookMetadata>,
          FutureOr<List<BookMetadata>>
        >
    with
        $FutureModifier<List<BookMetadata>>,
        $FutureProvider<List<BookMetadata>> {
  BookRecommendationsProvider._({
    required BookRecommendationsFamily super.from,
    required (String, {BookRecommendationType? type}) super.argument,
  }) : super(
         retry: null,
         name: r'bookRecommendationsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookRecommendationsHash();

  @override
  String toString() {
    return r'bookRecommendationsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<BookMetadata>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookMetadata>> create(Ref ref) {
    final argument = this.argument as (String, {BookRecommendationType? type});
    return bookRecommendations(ref, argument.$1, type: argument.type);
  }

  @override
  bool operator ==(Object other) {
    return other is BookRecommendationsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookRecommendationsHash() =>
    r'2b1a5b922ed6df14d51bdb0f844929caf00a1d3a';

final class BookRecommendationsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<BookMetadata>>,
          (String, {BookRecommendationType? type})
        > {
  BookRecommendationsFamily._()
    : super(
        retry: null,
        name: r'bookRecommendationsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookRecommendationsProvider call(
    String isbn, {
    BookRecommendationType? type,
  }) => BookRecommendationsProvider._(argument: (isbn, type: type), from: this);

  @override
  String toString() => r'bookRecommendationsProvider';
}

/// 공공도서관 대출 통계 기준 인기 도서 (최근 3개월).

@ProviderFor(popularBooks)
final popularBooksProvider = PopularBooksProvider._();

/// 공공도서관 대출 통계 기준 인기 도서 (최근 3개월).

final class PopularBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookMetadata>>,
          List<BookMetadata>,
          FutureOr<List<BookMetadata>>
        >
    with
        $FutureModifier<List<BookMetadata>>,
        $FutureProvider<List<BookMetadata>> {
  /// 공공도서관 대출 통계 기준 인기 도서 (최근 3개월).
  PopularBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popularBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$popularBooksHash();

  @$internal
  @override
  $FutureProviderElement<List<BookMetadata>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookMetadata>> create(Ref ref) {
    return popularBooks(ref);
  }
}

String _$popularBooksHash() => r'6947decf59214a71fb0a1033de7c83174f44b49e';

/// 책장에 담기 전 책 정보 (ISBN으로 외부 제공처 조회, DB 저장 안 함).

@ProviderFor(externalBook)
final externalBookProvider = ExternalBookFamily._();

/// 책장에 담기 전 책 정보 (ISBN으로 외부 제공처 조회, DB 저장 안 함).

final class ExternalBookProvider
    extends
        $FunctionalProvider<
          AsyncValue<BookMetadata>,
          BookMetadata,
          FutureOr<BookMetadata>
        >
    with $FutureModifier<BookMetadata>, $FutureProvider<BookMetadata> {
  /// 책장에 담기 전 책 정보 (ISBN으로 외부 제공처 조회, DB 저장 안 함).
  ExternalBookProvider._({
    required ExternalBookFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'externalBookProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$externalBookHash();

  @override
  String toString() {
    return r'externalBookProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<BookMetadata> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BookMetadata> create(Ref ref) {
    final argument = this.argument as String;
    return externalBook(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExternalBookProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$externalBookHash() => r'bcfef8bd2d0383a3ba033efd29ff99fe8a63eebb';

/// 책장에 담기 전 책 정보 (ISBN으로 외부 제공처 조회, DB 저장 안 함).

final class ExternalBookFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<BookMetadata>, String> {
  ExternalBookFamily._()
    : super(
        retry: null,
        name: r'externalBookProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 책장에 담기 전 책 정보 (ISBN으로 외부 제공처 조회, DB 저장 안 함).

  ExternalBookProvider call(String isbn) =>
      ExternalBookProvider._(argument: isbn, from: this);

  @override
  String toString() => r'externalBookProvider';
}
