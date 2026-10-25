// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_bookshelves_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 내 책장 목록 (생성 시각 최신순). 책장이 없으면 빈 리스트.

@ProviderFor(myBookshelves)
final myBookshelvesProvider = MyBookshelvesProvider._();

/// 내 책장 목록 (생성 시각 최신순). 책장이 없으면 빈 리스트.

final class MyBookshelvesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BookshelfResponse>>,
          List<BookshelfResponse>,
          FutureOr<List<BookshelfResponse>>
        >
    with
        $FutureModifier<List<BookshelfResponse>>,
        $FutureProvider<List<BookshelfResponse>> {
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
  $FutureProviderElement<List<BookshelfResponse>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BookshelfResponse>> create(Ref ref) {
    return myBookshelves(ref);
  }
}

String _$myBookshelvesHash() => r'ef418fae805d3326f681ee28ba86d61d710d87a3';
