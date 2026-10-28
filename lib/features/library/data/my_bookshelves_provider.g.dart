// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_bookshelves_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 내 책장 목록 (생성 시각 최신순). 책장이 없으면 빈 리스트.

@ProviderFor(MyBookshelves)
final myBookshelvesProvider = MyBookshelvesProvider._();

/// 내 책장 목록 (생성 시각 최신순). 책장이 없으면 빈 리스트.
final class MyBookshelvesProvider
    extends $AsyncNotifierProvider<MyBookshelves, List<BookshelfResponse>> {
  /// 내 책장 목록 (생성 시각 최신순). 책장이 없으면 빈 리스트.
  MyBookshelvesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myBookshelvesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myBookshelvesHash();

  @$internal
  @override
  MyBookshelves create() => MyBookshelves();
}

String _$myBookshelvesHash() => r'842eaa5ad2999092950e9b19c365b990a14ee7a7';

/// 내 책장 목록 (생성 시각 최신순). 책장이 없으면 빈 리스트.

abstract class _$MyBookshelves extends $AsyncNotifier<List<BookshelfResponse>> {
  FutureOr<List<BookshelfResponse>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<BookshelfResponse>>,
              List<BookshelfResponse>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BookshelfResponse>>,
                List<BookshelfResponse>
              >,
              AsyncValue<List<BookshelfResponse>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// 책장 한 개의 요약(이름·책 수·템플릿·색상).

@ProviderFor(bookshelf)
final bookshelfProvider = BookshelfFamily._();

/// 책장 한 개의 요약(이름·책 수·템플릿·색상).

final class BookshelfProvider
    extends
        $FunctionalProvider<
          AsyncValue<BookshelfResponse>,
          BookshelfResponse,
          FutureOr<BookshelfResponse>
        >
    with
        $FutureModifier<BookshelfResponse>,
        $FutureProvider<BookshelfResponse> {
  /// 책장 한 개의 요약(이름·책 수·템플릿·색상).
  BookshelfProvider._({
    required BookshelfFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookshelfProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookshelfHash();

  @override
  String toString() {
    return r'bookshelfProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<BookshelfResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BookshelfResponse> create(Ref ref) {
    final argument = this.argument as String;
    return bookshelf(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookshelfProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookshelfHash() => r'af34df45d0daab489b2e62e91588dabf5054cfc2';

/// 책장 한 개의 요약(이름·책 수·템플릿·색상).

final class BookshelfFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<BookshelfResponse>, String> {
  BookshelfFamily._()
    : super(
        retry: null,
        name: r'bookshelfProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 책장 한 개의 요약(이름·책 수·템플릿·색상).

  BookshelfProvider call(String bookshelfId) =>
      BookshelfProvider._(argument: bookshelfId, from: this);

  @override
  String toString() => r'bookshelfProvider';
}

/// 책장 안의 책 한 권 상세. [bookId]는 ISBN이 아니라 `book.id`.

@ProviderFor(bookshelfBook)
final bookshelfBookProvider = BookshelfBookFamily._();

/// 책장 안의 책 한 권 상세. [bookId]는 ISBN이 아니라 `book.id`.

final class BookshelfBookProvider
    extends
        $FunctionalProvider<
          AsyncValue<BookshelfBookResponse>,
          BookshelfBookResponse,
          FutureOr<BookshelfBookResponse>
        >
    with
        $FutureModifier<BookshelfBookResponse>,
        $FutureProvider<BookshelfBookResponse> {
  /// 책장 안의 책 한 권 상세. [bookId]는 ISBN이 아니라 `book.id`.
  BookshelfBookProvider._({
    required BookshelfBookFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'bookshelfBookProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookshelfBookHash();

  @override
  String toString() {
    return r'bookshelfBookProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<BookshelfBookResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BookshelfBookResponse> create(Ref ref) {
    final argument = this.argument as (String, String);
    return bookshelfBook(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is BookshelfBookProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookshelfBookHash() => r'df53b278a87620a8cd2689aafdd2641577cee48e';

/// 책장 안의 책 한 권 상세. [bookId]는 ISBN이 아니라 `book.id`.

final class BookshelfBookFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<BookshelfBookResponse>,
          (String, String)
        > {
  BookshelfBookFamily._()
    : super(
        retry: null,
        name: r'bookshelfBookProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 책장 안의 책 한 권 상세. [bookId]는 ISBN이 아니라 `book.id`.

  BookshelfBookProvider call(String bookshelfId, String bookId) =>
      BookshelfBookProvider._(argument: (bookshelfId, bookId), from: this);

  @override
  String toString() => r'bookshelfBookProvider';
}

/// 책장 안의 책 목록.

@ProviderFor(BookshelfBooks)
final bookshelfBooksProvider = BookshelfBooksFamily._();

/// 책장 안의 책 목록.
final class BookshelfBooksProvider
    extends
        $AsyncNotifierProvider<BookshelfBooks, List<BookshelfBookResponse>> {
  /// 책장 안의 책 목록.
  BookshelfBooksProvider._({
    required BookshelfBooksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookshelfBooksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookshelfBooksHash();

  @override
  String toString() {
    return r'bookshelfBooksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BookshelfBooks create() => BookshelfBooks();

  @override
  bool operator ==(Object other) {
    return other is BookshelfBooksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookshelfBooksHash() => r'676662d665b40f51829e6aec82e6aa5cdacf9e64';

/// 책장 안의 책 목록.

final class BookshelfBooksFamily extends $Family
    with
        $ClassFamilyOverride<
          BookshelfBooks,
          AsyncValue<List<BookshelfBookResponse>>,
          List<BookshelfBookResponse>,
          FutureOr<List<BookshelfBookResponse>>,
          String
        > {
  BookshelfBooksFamily._()
    : super(
        retry: null,
        name: r'bookshelfBooksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 책장 안의 책 목록.

  BookshelfBooksProvider call(String bookshelfId) =>
      BookshelfBooksProvider._(argument: bookshelfId, from: this);

  @override
  String toString() => r'bookshelfBooksProvider';
}

/// 책장 안의 책 목록.

abstract class _$BookshelfBooks
    extends $AsyncNotifier<List<BookshelfBookResponse>> {
  late final _$args = ref.$arg as String;
  String get bookshelfId => _$args;

  FutureOr<List<BookshelfBookResponse>> build(String bookshelfId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<BookshelfBookResponse>>,
              List<BookshelfBookResponse>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BookshelfBookResponse>>,
                List<BookshelfBookResponse>
              >,
              AsyncValue<List<BookshelfBookResponse>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// 내 모든 책장의 책 (같은 책은 한 번만).

@ProviderFor(myLibraryBooks)
final myLibraryBooksProvider = MyLibraryBooksProvider._();

/// 내 모든 책장의 책 (같은 책은 한 번만).

final class MyLibraryBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookResponse>>,
          List<BookResponse>,
          FutureOr<List<BookResponse>>
        >
    with
        $FutureModifier<List<BookResponse>>,
        $FutureProvider<List<BookResponse>> {
  /// 내 모든 책장의 책 (같은 책은 한 번만).
  MyLibraryBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myLibraryBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myLibraryBooksHash();

  @$internal
  @override
  $FutureProviderElement<List<BookResponse>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookResponse>> create(Ref ref) {
    return myLibraryBooks(ref);
  }
}

String _$myLibraryBooksHash() => r'24489bae320dc3c21373850cab4c2c00f2fb9258';

/// 책장 꾸미기(이름·템플릿·표지 색상·미리보기 배치).

@ProviderFor(BookshelfDecoration)
final bookshelfDecorationProvider = BookshelfDecorationFamily._();

/// 책장 꾸미기(이름·템플릿·표지 색상·미리보기 배치).
final class BookshelfDecorationProvider
    extends
        $AsyncNotifierProvider<
          BookshelfDecoration,
          BookshelfDecorationResponse
        > {
  /// 책장 꾸미기(이름·템플릿·표지 색상·미리보기 배치).
  BookshelfDecorationProvider._({
    required BookshelfDecorationFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookshelfDecorationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookshelfDecorationHash();

  @override
  String toString() {
    return r'bookshelfDecorationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BookshelfDecoration create() => BookshelfDecoration();

  @override
  bool operator ==(Object other) {
    return other is BookshelfDecorationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookshelfDecorationHash() =>
    r'd79b657b5304c2f8d1b2e683d4812e1c3fe45922';

/// 책장 꾸미기(이름·템플릿·표지 색상·미리보기 배치).

final class BookshelfDecorationFamily extends $Family
    with
        $ClassFamilyOverride<
          BookshelfDecoration,
          AsyncValue<BookshelfDecorationResponse>,
          BookshelfDecorationResponse,
          FutureOr<BookshelfDecorationResponse>,
          String
        > {
  BookshelfDecorationFamily._()
    : super(
        retry: null,
        name: r'bookshelfDecorationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 책장 꾸미기(이름·템플릿·표지 색상·미리보기 배치).

  BookshelfDecorationProvider call(String bookshelfId) =>
      BookshelfDecorationProvider._(argument: bookshelfId, from: this);

  @override
  String toString() => r'bookshelfDecorationProvider';
}

/// 책장 꾸미기(이름·템플릿·표지 색상·미리보기 배치).

abstract class _$BookshelfDecoration
    extends $AsyncNotifier<BookshelfDecorationResponse> {
  late final _$args = ref.$arg as String;
  String get bookshelfId => _$args;

  FutureOr<BookshelfDecorationResponse> build(String bookshelfId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<BookshelfDecorationResponse>,
              BookshelfDecorationResponse
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<BookshelfDecorationResponse>,
                BookshelfDecorationResponse
              >,
              AsyncValue<BookshelfDecorationResponse>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
