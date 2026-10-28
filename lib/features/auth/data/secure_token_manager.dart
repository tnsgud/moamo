import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

/// 카카오 SDK 토큰(액세스·리프레시)을 Keychain/Keystore에 저장한다.
///
/// SDK 기본 저장소는 앱 정보로 만든 키로 암호화해 SharedPreferences에 넣는데,
/// 리프레시 토큰은 오래 살아남는 로그인 수단이라 OS 보안 저장소에 둔다.
/// `TokenManagerProvider.instance.manager`에 넣어 쓴다.
class SecureTokenManager implements TokenManager {
  static const _key = 'kakao_oauth_token';
  static const _storage = FlutterSecureStorage();

  OAuthToken? _cache;

  @override
  Future<OAuthToken?> getToken() async {
    if (_cache != null) return _cache;
    final json = await _storage.read(key: _key);
    if (json == null) return null;
    try {
      return _cache = OAuthToken.fromJson(jsonDecode(json));
    } catch (_) {
      await clear();
      return null;
    }
  }

  @override
  Future<void> setToken(OAuthToken token) async {
    _cache = token;
    await _storage.write(key: _key, value: jsonEncode(token));
  }

  @override
  Future<void> clear() async {
    _cache = null;
    await _storage.delete(key: _key);
  }
}
