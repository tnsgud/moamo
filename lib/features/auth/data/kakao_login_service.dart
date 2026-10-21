import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

/// 카카오 네이티브 앱 키. 앱에 포함되는 공개 값이다(REST API 키·시크릿과 다르다).
const kakaoNativeAppKey = '87549346071724b6aee676bfe6e06144';

/// 카카오 로그인을 진행하고 **카카오 액세스 토큰**을 돌려준다.
///
/// 카카오톡이 설치돼 있으면 카카오톡으로, 아니면 카카오계정(웹)으로 로그인한다.
/// 사용자가 취소하면 null을 돌려준다.
Future<String?> loginWithKakao() async {
  try {
    final OAuthToken token;
    if (await isKakaoTalkInstalled()) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
      } on KakaoClientException catch (e) {
        if (e.reason == ClientErrorCause.cancelled) return null;
        // 카카오톡 연동이 실패하면 카카오계정 로그인으로 넘어간다.
        return (await UserApi.instance.loginWithKakaoAccount()).accessToken;
      }
    } else {
      token = await UserApi.instance.loginWithKakaoAccount();
    }
    return token.accessToken;
  } on KakaoClientException catch (e) {
    if (e.reason == ClientErrorCause.cancelled) return null;
    rethrow;
  }
}

/// 로그인한 카카오 계정의 닉네임을 가져온다.
///
/// 카카오 개발자 콘솔에서 '프로필 정보(닉네임)' 동의 항목을 켜 둬야 하며,
/// 사용자가 동의하지 않았거나 값이 없으면 null을 돌려준다.
Future<String?> fetchKakaoNickname() async {
  final user = await UserApi.instance.me();
  return user.kakaoAccount?.profile?.nickname;
}
