// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/get_api_auth_me_response.dart';
import '../models/kakao_login_request.dart';
import '../models/post_api_auth_kakao_response.dart';
import '../models/post_api_auth_signup_response.dart';
import '../models/signup_request.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  /// 닉네임으로 카카오 회원 가입 완료.
  ///
  /// POST /api/auth/kakao에서 SIGNUP_REQUIRED를 받은 사용자가 가입 전용 signupToken으로 호출합니다.
  /// Swagger Authorize의 signupToken 항목에는 토큰 값만 입력합니다.
  /// 닉네임의 앞뒤 공백을 제거한 뒤 2~20자로 검증하며 닉네임 중복은 허용합니다.
  /// 카카오 회원번호는 검증된 JWT에서 가져오므로 요청 본문으로 받지 않습니다.
  /// 가입 완료 시 회원을 DB에 저장하고 LOGIN_SUCCESS와 일반 API용 accessToken을 반환합니다.
  /// 프런트는 signupToken을 폐기하고 accessToken으로 교체합니다.
  /// 이미 가입된 계정으로 재시도하면 409입니다. 만료된 가입 토큰은 다시 카카오 로그인해 발급받습니다.
  @POST('/api/auth/signup')
  Future<PostApiAuthSignupResponse> completeKakaoSignup({
    @Body() required SignupRequest body,
  });

  /// 앱의 카카오 액세스 토큰으로 로그인 또는 가입 준비.
  ///
  /// 앱에서 카카오 SDK 로그인을 마친 뒤 받은 액세스 토큰을 JSON 본문의 kakaoAccessToken으로 전송합니다.
  /// 이 API는 서비스 JWT 없이 호출하며 Authorization 헤더에는 카카오 토큰을 넣지 않습니다.
  /// 서버는 카카오 액세스 토큰 정보 API에서 토큰의 유효기간과 회원번호를 확인한 뒤.
  /// 사용자 정보 API에서 회원번호 id를 다시 조회합니다. 프런트가 전달한 사용자 ID·닉네임은 인증에 사용하지 않습니다.
  /// 서버에 카카오 앱 ID·앱 키·시크릿을 설정하지 않으며 토큰의 발급 앱은 제한하지 않습니다.
  /// 기존 회원은 LOGIN_SUCCESS와 서비스 accessToken, member.memberId(서비스 UUID), member.providerId(카카오 회원번호)를 받습니다.
  /// 신규 사용자는 SIGNUP_REQUIRED와 가입 전용 signupToken을 받으며 아직 DB에 회원을 생성하지 않습니다.
  /// 프런트는 data.status로 분기하고 신규 사용자의 닉네임을 받아 POST /api/auth/signup을 호출합니다.
  /// 두 성공 분기는 모두 HTTP 200이며 success·code·message·data 공통 래퍼를 사용합니다.
  /// 카카오 토큰은 DB에 저장하거나 응답에 돌려주지 않습니다. 인가 코드·ID 토큰을 받는 API가 아닙니다.
  @POST('/api/auth/kakao')
  Future<PostApiAuthKakaoResponse> loginWithKakaoAccessToken({
    @Body() required KakaoLoginRequest body,
  });

  /// 내 회원 정보 조회.
  ///
  /// 액세스 JWT의 sub(서비스 회원 UUID)로 DB에서 가입된 회원 정보를 조회합니다. 가입 전용 토큰으로는 호출할 수 없습니다. 회원이 DB에 없거나 sub가 잘못된 경우 401입니다.
  @GET('/api/auth/me')
  Future<GetApiAuthMeResponse> getCurrentMember();
}
