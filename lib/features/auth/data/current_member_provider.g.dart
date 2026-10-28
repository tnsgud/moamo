// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 로그인한 내 정보 (`memberId`·닉네임).

@ProviderFor(currentMember)
final currentMemberProvider = CurrentMemberProvider._();

/// 로그인한 내 정보 (`memberId`·닉네임).

final class CurrentMemberProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthUserResponse>,
          AuthUserResponse,
          FutureOr<AuthUserResponse>
        >
    with $FutureModifier<AuthUserResponse>, $FutureProvider<AuthUserResponse> {
  /// 로그인한 내 정보 (`memberId`·닉네임).
  CurrentMemberProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentMemberProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentMemberHash();

  @$internal
  @override
  $FutureProviderElement<AuthUserResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthUserResponse> create(Ref ref) {
    return currentMember(ref);
  }
}

String _$currentMemberHash() => r'e08c28bd01bcef3376237329be1efe8aacaf078c';
