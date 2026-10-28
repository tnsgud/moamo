// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_memos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 책장에 담긴 책 한 권의 내 메모 목록 (공개·비공개 모두).
/// [bookId]는 ISBN이 아니라 `book.id`.

@ProviderFor(BookMemos)
final bookMemosProvider = BookMemosFamily._();

/// 책장에 담긴 책 한 권의 내 메모 목록 (공개·비공개 모두).
/// [bookId]는 ISBN이 아니라 `book.id`.
final class BookMemosProvider
    extends $AsyncNotifierProvider<BookMemos, List<BookMemoResponse>> {
  /// 책장에 담긴 책 한 권의 내 메모 목록 (공개·비공개 모두).
  /// [bookId]는 ISBN이 아니라 `book.id`.
  BookMemosProvider._({
    required BookMemosFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'bookMemosProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookMemosHash();

  @override
  String toString() {
    return r'bookMemosProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  BookMemos create() => BookMemos();

  @override
  bool operator ==(Object other) {
    return other is BookMemosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookMemosHash() => r'388bb44ab5c822e546a93b0cd4ee534263415c60';

/// 책장에 담긴 책 한 권의 내 메모 목록 (공개·비공개 모두).
/// [bookId]는 ISBN이 아니라 `book.id`.

final class BookMemosFamily extends $Family
    with
        $ClassFamilyOverride<
          BookMemos,
          AsyncValue<List<BookMemoResponse>>,
          List<BookMemoResponse>,
          FutureOr<List<BookMemoResponse>>,
          (String, String)
        > {
  BookMemosFamily._()
    : super(
        retry: null,
        name: r'bookMemosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 책장에 담긴 책 한 권의 내 메모 목록 (공개·비공개 모두).
  /// [bookId]는 ISBN이 아니라 `book.id`.

  BookMemosProvider call(String bookshelfId, String bookId) =>
      BookMemosProvider._(argument: (bookshelfId, bookId), from: this);

  @override
  String toString() => r'bookMemosProvider';
}

/// 책장에 담긴 책 한 권의 내 메모 목록 (공개·비공개 모두).
/// [bookId]는 ISBN이 아니라 `book.id`.

abstract class _$BookMemos extends $AsyncNotifier<List<BookMemoResponse>> {
  late final _$args = ref.$arg as (String, String);
  String get bookshelfId => _$args.$1;
  String get bookId => _$args.$2;

  FutureOr<List<BookMemoResponse>> build(String bookshelfId, String bookId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<BookMemoResponse>>, List<BookMemoResponse>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BookMemoResponse>>,
                List<BookMemoResponse>
              >,
              AsyncValue<List<BookMemoResponse>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
