// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'bookshelf/bookshelf_client.dart';
import 'auth/auth_client.dart';

/// 독서 서비스 REST API `v0.0.1-SNAPSHOT`.
///
/// 카카오 로그인과 닉네임 가입, 공공 도서 검색, 회원별 책장과 글·사진 메모, 방명록, 최근 검색어를 제공하는 API입니다.
///
/// ### 로그인과 가입.
/// 1. 앱에서 카카오 SDK로 로그인하고 받은 액세스 토큰을 `POST /api/auth/kakao`의 JSON 본문 `kakaoAccessToken`으로 전송합니다.
/// 2. 서버가 카카오에서 토큰의 유효기간과 사용자 ID를 확인합니다. 공통 응답의 `success`를 확인하고 `data.status`로 분기합니다.
/// 3. `LOGIN_SUCCESS`이면 `data.accessToken`으로 일반 API를 사용합니다.
/// 4. `SIGNUP_REQUIRED`이면 닉네임 화면을 표시하고 `data.signupToken`으로 `POST /api/auth/signup`을 호출합니다.
/// 5. 가입 완료 후 받은 `data.accessToken`으로 교체합니다. 가입 전에는 회원이 저장되지 않습니다.
///
/// **Authorize에는 토큰 값만 입력합니다.** Swagger가 `Authorization: Bearer <토큰>`을 붙입니다.
/// `signupToken`은 가입 전용이고 나머지 API에는 `accessToken`이 필요합니다.
/// 기본 유효기간은 액세스 토큰 15분, 가입 토큰 5분이며 서버 설정에 따라 달라집니다.
/// 리프레시 토큰은 구현하지 않았으며 만료 후에는 카카오 로그인을 다시 진행합니다.
/// 카카오 로그인 API는 서비스 JWT 없이 호출하며 카카오 토큰은 본문에만 넣습니다. 카카오 ID를 요청 본문으로 받아 인증하지 않습니다.
/// 서비스 member.memberId는 UUID, member.providerId는 서버가 카카오에서 조회한 회원번호입니다.
///
/// ### 책장 사용 흐름.
/// - `GET /api/books`의 결과는 **ISBN으로 식별**하며 검색·인기·추천 조회만으로 책 정보를 저장하지 않습니다.
/// - `POST /api/bookshelf`에서 이름·템플릿·색상·아이템을 저장하며 빈 책장을 생성하고 책장 `id`를 보관합니다.
/// - 생성 직후 책 수는 0입니다. 이름만 보내면 기본 설정으로 생성합니다.
/// - `POST /api/bookshelf/{bookshelfId}/books`에 검색 결과의 `isbn`을 보내 책을 추가합니다.
/// - 이때만 책 정보를 저장하고, 같은 ISBN은 기존 책 UUID를 여러 회원·책장에서 재사용합니다.
/// - 같은 책장에 동일 ISBN의 책을 다시 추가하면 409입니다. 다른 책장에는 같은 책을 추가할 수 있습니다.
/// - `GET /api/bookshelf`는 책장 목록, `GET /api/bookshelf/{bookshelfId}/books`는 선택한 책장 안의 책 목록입니다.
/// - **회원 ID·책장 ID·개별 책 ID·공유 도서 정보 ID·검색 이력 ID는 서로 다릅니다.** 책장 책 응답의 `id`는 회원의 개별 책 UUID이고 `book.id`는 공유 도서 정보 UUID입니다.
/// - 메모는 개별 책에 연결합니다. 경로의 `bookId`는 `book.id`이며 `bookshelfId`와 함께 개별 책을 식별합니다.
///
/// ### 책장 꾸미기.
/// - 처음 `POST /api/bookshelf`에서 이름·템플릿·색상·아이템을 저장합니다. 생성 요청은 책을 받지 않습니다.
/// - `PUT /api/bookshelf/{bookshelfId}/decoration`으로 이름·템플릿 키·표지 색상·미리보기 배치를 함께 저장합니다.
/// - 생성된 책장에 책을 추가한 뒤 미리보기 수정의 `books`에서 책 UUID(`bookId`)를 사용합니다.
/// - `GET`으로 같은 경로를 조회해 화면을 복원합니다. 책 제목·저자·표지 URL을 함께 반환합니다.
/// - 책은 해당 책장에 담긴 것 중 최대 3권, 꾸미기 아이템은 최대 3개를 선택합니다.
/// - 모든 책·아이템의 `slot`은 0~5이고 중복할 수 없습니다. 책 표시 방식은 `FRONT`·`SPINE`입니다.
/// - 템플릿·아이템 키는 프런트의 자산 식별값이고 색상은 `#RRGGBB`입니다.
/// - 기본값은 `DEFAULT` 템플릿·`#D9DBFF` 색상·빈 미리보기입니다.
/// - 책장 목록에도 저장한 템플릿과 색상을 반환합니다. 책 삭제 시 해당 책의 미리보기 배치도 제거합니다.
///
/// ### 책 상세와 메모.
/// - `GET /api/bookshelf/{bookshelfId}/books/{bookId}`로 내 책장 안의 책 상세를 조회합니다.
/// - `GET /api/bookshelf/{bookshelfId}/books/{bookId}/memos`로 해당 책장에 담긴 개별 책의 내 메모를 조회하고 같은 경로에 multipart/form-data로 작성합니다.
/// - 회원은 JWT에서 확인하며 내 책장 소유권과 해당 책장에 담긴 개별 책을 확인합니다. 다른 회원·다른 책장에 담긴 같은 도서는 메모를 각각 관리합니다.
/// - 비공개 글 체크 시 `visibility=PRIVATE`, 해제 시 `PUBLIC`을 보냅니다. 생성 시 생략·기존 메모의 빈 값은 PRIVATE입니다.
/// - 내 메모 목록에는 PUBLIC·PRIVATE를 모두 반환합니다. `GET /api/books/{bookId}/memos/public`은 여러 회원의 공개 메모만 최신순 페이지로 반환합니다.
/// - PRIVATE 글·사진은 작성자만 조회합니다. 다른 회원이 상세·사진에 접근하면 `403`과 `code=PRIVATE_MEMO`, `data.visibility=PRIVATE`를 반환합니다.
/// - PUBLIC 글·사진은 다른 로그인 회원도 조회하지만 수정·삭제는 작성자만 가능합니다. 수정에서 visibility를 생략하면 기존 범위를 유지합니다.
/// - 글·사진 중 하나는 필수이며 메모당 사진 1장, JPEG·PNG 최대 5MiB 및 2,000만 화소를 허용합니다.
/// - 메모 UUID는 응답의 `id`입니다. `PUT .../memos/{memoId}`로 수정하고 `DELETE`로 삭제합니다.
/// - 사진 `imageUrl`은 JWT가 필요한 API 상대 경로입니다. Bearer 헤더를 포함한 fetch로 Blob을 받아 표시합니다.
/// - 메모·사진은 책장에 담긴 개별 책 UUID에 연결합니다. 같은 ISBN이라도 회원·책장마다 메모가 다릅니다.
/// - 책장 안의 개별 책을 삭제하면 해당 책의 메모·사진도 삭제합니다. 다른 책장·다른 회원의 개별 책과 메모는 유지합니다. 책장 삭제도 같은 규칙입니다.
/// - 메모 응답의 bookshelfBookId는 책장 책 응답의 id입니다. bookshelfId·bookId·id(메모 UUID)로 상세를 조회하며 사진 경로는 /api/bookshelf/{bookshelfId}/books/{bookId}/memos/{memoId}/image입니다.
///
/// ### 회원별 방명록.
/// - 모든 회원은 별도 생성 없이 `/api/members/{memberId}/guestbook`으로 방명록을 조회합니다.
/// - 로그인한 회원은 서로의 방명록을 조회하고 글·스티커를 작성할 수 있습니다. 내 방명록은 `/api/auth/me`의 `memberId`를 사용합니다.
/// - 목록은 주인 닉네임·전체 글 수·메뉴 권한과 최신순 페이지를 반환합니다. 기본 20개, 최대 100개입니다.
/// - 글 또는 스티커 중 하나는 필요합니다. 글 최대 1,000자, 스티커 자산 키 최대 10개입니다.
/// - `ownerEntry`로 주인 말풍선을, `canEdit`·`canDelete`로 수정·삭제 메뉴를 구분합니다.
/// - 작성자만 수정할 수 있고 작성자 또는 방명록 주인이 삭제할 수 있습니다.
/// - 주인은 `unread`·`unreadEntries`로 새 글을 표시하고 `POST .../guestbook/read`에 화면에 표시한 글 ID를 보내 읽음 처리합니다.
/// - 스티커는 프런트의 자산 키만 저장하며 작성자 카카오 계정 정보는 공개하지 않습니다.
///
/// ### 응답과 외부 제공처.
/// 응답의 생성·검색·추가 시각은 UTC ISO-8601이며 `publicationDate`는 제공처의 예정일·발행연도 문자열 원문입니다.
/// 목록이 없으면 `[]`, 검색 페이지는 `books: []`, 방명록 페이지는 `entries: []`를 반환합니다. 표지 등 외부 정보가 없으면 `null`입니다.
/// 도서 표지는 이미지 파일이 아닌 URL을 반환·저장합니다. 정보나루 표지는 비영리 화면 표시용 이용 조건을 따릅니다.
/// 사용자가 메모에 첨부한 사진은 DB에 저장하고 메모의 공개 범위에 따라 JWT로 조회합니다.
/// 예시의 토큰·UUID·도서 정보·이미지 URL은 형식을 보여 주는 값이므로 실제 응답값으로 바꿔 사용합니다.
/// 도서 제공처 인증키는 서버 환경변수로 설정하며, 필요한 키가 없으면 503·외부 호출 실패는 502입니다.
/// 모든 JSON 응답은 `application/json`이며 `success`, `code`, `message`, `data` 공통 래퍼를 사용합니다.
/// 성공은 `success=true`, `code=OK`이며 기존 DTO·배열·페이지는 `data`에서 꺼냅니다. 아래 필드 설명의 ID·목록·토큰도 data 내부 값입니다.
/// 실패는 `success=false`와 오류 코드·안내 메시지를 반환하며 추가 정보가 없으면 `data=null`입니다. 비공개 접근은 data.visibility=PRIVATE입니다.
/// JWT 보안 필터의 401·403, 카카오 토큰 인증 성공·실패, 입력 검증·서비스·서버 오류도 같은 래퍼입니다. HTTP 상태 코드는 유지합니다.
/// `204` 삭제·읽음 처리에는 본문이 없습니다. 사진 바이너리는 래퍼 없이 유지합니다.
/// OpenAPI 문서 JSON 자체는 래핑하지 않습니다. 요청 DTO와 multipart 폼에도 래퍼를 붙이지 않습니다.
///
class RestClient {
  RestClient(Dio dio, {String? baseUrl}) : _dio = dio, _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '0.0.1-SNAPSHOT';

  BookshelfClient? _bookshelf;
  AuthClient? _auth;

  BookshelfClient get bookshelf =>
      _bookshelf ??= BookshelfClient(_dio, baseUrl: _baseUrl);

  AuthClient get auth => _auth ??= AuthClient(_dio, baseUrl: _baseUrl);
}
