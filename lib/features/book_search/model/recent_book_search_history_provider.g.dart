// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_book_search_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookSearchHistory)
final bookSearchHistoryProvider = BookSearchHistoryProvider._();

final class BookSearchHistoryProvider
    extends
        $AsyncNotifierProvider<
          BookSearchHistory,
          List<BookSearchHistoryResponse>
        > {
  BookSearchHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookSearchHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookSearchHistoryHash();

  @$internal
  @override
  BookSearchHistory create() => BookSearchHistory();
}

String _$bookSearchHistoryHash() => r'd505f88deb7d8041970aa20954adb922c2fc0809';

abstract class _$BookSearchHistory
    extends $AsyncNotifier<List<BookSearchHistoryResponse>> {
  FutureOr<List<BookSearchHistoryResponse>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<BookSearchHistoryResponse>>,
              List<BookSearchHistoryResponse>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BookSearchHistoryResponse>>,
                List<BookSearchHistoryResponse>
              >,
              AsyncValue<List<BookSearchHistoryResponse>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
