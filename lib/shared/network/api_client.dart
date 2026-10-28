import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../api/auth/auth_client.dart';
import '../api/rest_client.dart';

const _baseUrl = 'https://reading-api-m65i.onrender.com';

// 서버가 잠들어 있으면(콜드 스타트) 첫 응답에 40초 넘게 걸릴 수 있다.
const _timeout = Duration(seconds: 60);

String? accessToken;

/// 401일 때 새 accessToken을 받아오는 함수. 실패하면 null. (main에서 연결)
Future<String?> Function()? onRefreshToken;

/// 새 토큰을 못 받았을 때 호출 (로그인 화면으로 보내기). (main에서 연결)
void Function()? onSessionExpired;

// 동시에 여러 요청이 401을 받아도 토큰은 한 번만 다시 받는다.
Future<String?>? _refreshing;

/// 401이면 토큰을 다시 받아 같은 요청을 한 번만 재시도한다.
Future<void> _retryOnUnauthorized(
  DioException err,
  ErrorInterceptorHandler handler,
) async {
  final options = err.requestOptions;
  final refresh = onRefreshToken;
  if (err.response?.statusCode != 401 ||
      refresh == null ||
      options.path.startsWith('/api/auth/') ||
      options.extra['retried'] == true) {
    return handler.next(err);
  }

  final token = await (_refreshing ??= refresh().whenComplete(
    () => _refreshing = null,
  ));
  if (token == null) {
    onSessionExpired?.call();
    return handler.next(err);
  }

  options.headers['Authorization'] = 'Bearer $token';
  options.extra['retried'] = true;
  // 한 번 보낸 multipart 본문은 다시 못 보내서 복제한다.
  if (options.data is FormData) {
    options.data = (options.data as FormData).clone();
  }
  try {
    handler.resolve(await _dio.fetch(options));
  } on DioException catch (e) {
    handler.next(e);
  }
}

final _dio =
    Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: _timeout,
          receiveTimeout: _timeout,
        ),
      )
      ..interceptors.addAll([
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (accessToken != null) {
              options.headers['Authorization'] = 'Bearer $accessToken';
            }

            handler.next(options);
          },
          onError: _retryOnUnauthorized,
        ),
        if (kDebugMode) _LogInterceptor(),
      ]);

final apiClient = RestClient(_dio);

/// `POST /api/auth/signup` 전용 클라이언트.
///
/// 이 API는 일반 accessToken이 아니라 **가입 전용 signupToken**을 Authorization 헤더로 받는다.
/// 생성된 메서드에는 헤더 파라미터가 없어서, 이 토큰을 헤더에 고정한 별도 Dio로 호출한다.
/// (전역 [accessToken]은 건드리지 않는다.)
AuthClient signupClient(String signupToken) {
  final dio = Dio(
    _dio.options.copyWith(headers: {'Authorization': 'Bearer $signupToken'}),
  );
  if (kDebugMode) dio.interceptors.add(_LogInterceptor());
  return AuthClient(dio);
}

/// 디버그 빌드에서만 요청·응답 요약을 출력한다. 토큰이 새지 않도록 헤더·본문은 찍지 않는다.
class _LogInterceptor extends Interceptor {
  static const _startedAt = 'startedAt';

  String _elapsed(RequestOptions options) {
    final started = options.extra[_startedAt] as int?;
    if (started == null) return '';
    return ' (${DateTime.now().millisecondsSinceEpoch - started}ms)';
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_startedAt] = DateTime.now().millisecondsSinceEpoch;
    debugPrint('[API] → ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final options = response.requestOptions;
    debugPrint(
      '[API] ← ${response.statusCode} ${options.method} ${options.path}'
      '${_elapsed(options)}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    debugPrint(
      '[API] ✗ ${err.response?.statusCode ?? err.type.name} '
      '${options.method} ${options.path}${_elapsed(options)}'
      '${err.response == null ? ' ${err.message ?? ''}' : ' ${err.response?.data}'}',
    );
    handler.next(err);
  }
}
