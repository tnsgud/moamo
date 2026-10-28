// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guestbook_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 회원 방명록. 서버는 최신순으로 준다.

@ProviderFor(Guestbook)
final guestbookProvider = GuestbookFamily._();

/// 회원 방명록. 서버는 최신순으로 준다.
final class GuestbookProvider
    extends $AsyncNotifierProvider<Guestbook, GuestbookResponse> {
  /// 회원 방명록. 서버는 최신순으로 준다.
  GuestbookProvider._({
    required GuestbookFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'guestbookProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$guestbookHash();

  @override
  String toString() {
    return r'guestbookProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Guestbook create() => Guestbook();

  @override
  bool operator ==(Object other) {
    return other is GuestbookProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$guestbookHash() => r'a606e9f7b75179c7801a038b221a793764e8714e';

/// 회원 방명록. 서버는 최신순으로 준다.

final class GuestbookFamily extends $Family
    with
        $ClassFamilyOverride<
          Guestbook,
          AsyncValue<GuestbookResponse>,
          GuestbookResponse,
          FutureOr<GuestbookResponse>,
          String
        > {
  GuestbookFamily._()
    : super(
        retry: null,
        name: r'guestbookProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 회원 방명록. 서버는 최신순으로 준다.

  GuestbookProvider call(String memberId) =>
      GuestbookProvider._(argument: memberId, from: this);

  @override
  String toString() => r'guestbookProvider';
}

/// 회원 방명록. 서버는 최신순으로 준다.

abstract class _$Guestbook extends $AsyncNotifier<GuestbookResponse> {
  late final _$args = ref.$arg as String;
  String get memberId => _$args;

  FutureOr<GuestbookResponse> build(String memberId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<GuestbookResponse>, GuestbookResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GuestbookResponse>, GuestbookResponse>,
              AsyncValue<GuestbookResponse>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
