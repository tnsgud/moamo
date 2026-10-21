// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/bookshelf_add_request.dart';
import '../models/bookshelf_create_request.dart';
import '../models/bookshelf_decoration_request.dart';
import '../models/get_api_bookshelf_bookshelf_id_books_book_id_response.dart';
import '../models/get_api_bookshelf_bookshelf_id_books_response.dart';
import '../models/get_api_bookshelf_bookshelf_id_decoration_response.dart';
import '../models/get_api_bookshelf_bookshelf_id_response.dart';
import '../models/get_api_bookshelf_response.dart';
import '../models/post_api_bookshelf_bookshelf_id_books_response.dart';
import '../models/post_api_bookshelf_response.dart';
import '../models/put_api_bookshelf_bookshelf_id_decoration_response.dart';

part 'bookshelf_client.g.dart';

@RestApi()
abstract class BookshelfClient {
  factory BookshelfClient(Dio dio, {String? baseUrl}) = _BookshelfClient;

  /// 책장 꾸미기 설정과 미리보기 조회.
  ///
  /// 저장된 책장 이름·템플릿 키·책 표지/책등 색상·미리보기 책·꾸미기 아이템을 반환합니다.
  /// 생성 또는 수정할 때 저장한 설정을 반환합니다. 생성 직후 books는 빈 배열이며 items는 생성 시 선택한 배치입니다.
  /// 생성 시 설정을 생략했으면 DEFAULT·#D9DBFF·빈 items입니다.
  /// 이전 책장의 설정 컬럼이 null이면 같은 기본값을 적용합니다.
  /// books에는 선택한 책의 제목·저자·표지 URL과 FRONT/SPINE 표시 방식이 포함됩니다.
  /// books·items는 각각 slot 오름차순입니다. 프런트는 두 배열을 slot으로 합쳐 미리보기를 복원합니다.
  /// 위치는 0~5이며 비어 있는 위치는 빈 슬롯으로 표시합니다. 미리보기 선택 책은 최대 3권, 아이템은 최대 3개입니다.
  /// 템플릿과 아이템 이미지는 프런트의 templateKey·itemKey 대응 자산으로 표시합니다.
  /// 내 책장만 조회할 수 있으며 외부 도서 API를 호출하지 않습니다.
  ///
  /// [bookshelfId] - 내 책장 UUID.
  @GET('/api/bookshelf/{bookshelfId}/decoration')
  Future<GetApiBookshelfBookshelfIdDecorationResponse> getMyBookshelfDecoration({
    @Path('bookshelfId') required String bookshelfId,
  });

  /// 책장 꾸미기 저장 (이름·템플릿·색상·미리보기 전체 교체).
  ///
  /// 화면의 '책장 저장하기'에서 선택한 설정을 한 번에 저장합니다. 책장 이름도 함께 수정합니다.
  /// name은 앞뒤 공백 제거 후 1~50자, templateKey는 대문자 영문·숫자·밑줄 키, coverColor는 #RRGGBB입니다.
  /// 템플릿·아이템 키와 색상은 앞뒤 공백 제거 및 대문자 정규화 후 저장합니다.
  /// books에는 해당 책장에 이미 담긴 book.id를 최대 3개 전송합니다. 다른 책장에만 담긴 책은 선택할 수 없습니다.
  /// 각 책의 displayType은 FRONT(앞표지)·SPINE(책등)이며 생략 시 SPINE입니다. items는 최대 3개입니다.
  /// 모든 책·아이템의 slot은 0~5이고 서로 중복할 수 없습니다. 같은 책을 미리보기에 반복 선택하면 400입니다.
  /// 같은 꾸미기 아이템은 서로 다른 위치에 반복 배치할 수 있습니다.
  /// books·items 생략, null, 빈 배열은 해당 미리보기 선택을 비웁니다. 책장에 담긴 실제 책과 메모는 삭제하지 않습니다.
  /// 설정과 이름을 한 트랜잭션에서 저장하므로 일부만 반영되지 않습니다. 반복 저장은 기존 설정을 교체합니다.
  /// 템플릿·아이템은 프런트 자산의 식별 키를 저장하며 이미지 파일을 업로드하는 API가 아닙니다.
  ///
  /// [bookshelfId] - 꾸밀 내 책장 UUID.
  @PUT('/api/bookshelf/{bookshelfId}/decoration')
  Future<PutApiBookshelfBookshelfIdDecorationResponse> saveMyBookshelfDecoration({
    @Path('bookshelfId') required String bookshelfId,
    @Body() required BookshelfDecorationRequest body,
  });

  /// 내 책장 목록 조회.
  ///
  /// 로그인한 회원이 소유한 책장을 생성 시각 최신순으로 반환합니다. 책장별 id·이름·현재 책 수·생성 시각·템플릿 키·표지 색상이 포함됩니다. 책장이 없으면 빈 배열이며 자동으로 책장을 만들지 않습니다. 저장한 미리보기 책과 아이템은 /{bookshelfId}/decoration에서 조회합니다. 이 응답은 책장 목록이고 각 책장 안의 책 목록은 별도 /{bookshelfId}/books 경로에서 조회합니다.
  @GET('/api/bookshelf')
  Future<GetApiBookshelfResponse> getMyBookshelves();

  /// 이름·템플릿·꾸미기 설정으로 빈 책장 생성.
  ///
  /// 처음 책장을 만들 때 이름과 템플릿·색상·아이템 설정을 함께 저장합니다. 책이 없는 빈 책장을 생성합니다.
  /// 한 회원은 여러 책장을 만들 수 있고 같은 이름도 허용합니다.
  /// name은 앞뒤 공백을 제거한 뒤 1~50자로 검증합니다. 회원 ID는 액세스 JWT에서 확인합니다.
  /// templateKey·coverColor 생략 또는 null이면 DEFAULT·#D9DBFF입니다. 값은 앞뒤 공백 제거·대문자 정규화 후 저장합니다.
  /// items는 최대 3개이고 slot은 0~5에서 중복할 수 없습니다. 생략·null·빈 배열이면 아이템 없이 생성합니다.
  /// 이름만 보내면 기본 설정의 빈 책장입니다. 생성 요청에는 책·ISBN·책 UUID를 받는 필드가 없습니다.
  /// 책장과 꾸미기 설정을 한 트랜잭션으로 저장합니다. 외부 도서 API를 호출하거나 책 정보·책장 책 연결을 저장하지 않습니다.
  /// 201 응답의 id는 책장 UUID이고 bookCount는 항상 0입니다. 저장한 꾸미기는 /{id}/decoration에서 조회합니다.
  /// 생성 후 POST /api/bookshelf/{id}/books에 ISBN을 보내 책을 추가합니다.
  /// 책을 담은 뒤 PUT /api/bookshelf/{id}/decoration에서 bookId로 미리보기 책을 선택할 수 있습니다.
  /// 책장 목록이 빈 배열일 때 프런트의 '첫 책장 만들기' 흐름에서 사용합니다.
  @POST('/api/bookshelf')
  Future<PostApiBookshelfResponse> createMyBookshelf({
    @Body() required BookshelfCreateRequest body,
  });

  /// 선택한 책장에 담긴 책 목록 조회.
  ///
  /// 저장된 책 정보와 해당 책장에 추가한 시각을 최신순으로 반환합니다. 외부 API를 호출하지 않습니다. 내 빈 책장이면 200과 빈 배열, 없는 책장 또는 다른 회원의 책장이면 404입니다. 각 항목의 id는 회원·책장마다 다른 개별 책 UUID이며, book.id는 공유 도서 정보 UUID입니다. 메모도 개별 책마다 다릅니다. 현재 전체 목록을 반환하며 별도의 페이지 파라미터는 없습니다.
  ///
  /// [bookshelfId] - 조회할 내 책장 UUID.
  @GET('/api/bookshelf/{bookshelfId}/books')
  Future<GetApiBookshelfBookshelfIdBooksResponse> getBooksInMyBookshelf({
    @Path('bookshelfId') required String bookshelfId,
  });

  /// 선택한 책장에 ISBN으로 책 추가.
  ///
  /// 검색 결과의 ISBN-13만 전송합니다. 공백·하이픈을 제거한 값으로 처리합니다.
  /// 먼저 내 책장인지 확인하고, DB에 없는 ISBN이면 서버가 외부 API에서 제목·저자·표지 URL 등을 조회합니다.
  /// 책 정보와 해당 책장 연결은 한 트랜잭션으로 저장하며 실패하면 새 책 정보도 남지 않습니다.
  /// 이미 저장된 ISBN은 기존 책 UUID와 메타데이터를 재사용하고 외부 API를 호출하지 않습니다.
  /// 같은 책장에 동일 ISBN의 책이 이미 있으면 409로 거절합니다. 다른 책장에는 같은 책을 담을 수 있습니다.
  /// 추가 성공 시 200입니다. 회원 ID·제목·표지 URL은 요청 본문으로 받지 않습니다.
  /// 표지 이미지 파일을 저장하지 않고 URL만 저장합니다. 표지가 없으면 null입니다.
  /// 없는 책장 또는 다른 회원의 책장은 404이며, 외부 API 조회 전에 접근을 차단합니다.
  ///
  /// [bookshelfId] - 책을 담을 내 책장 UUID.
  @POST('/api/bookshelf/{bookshelfId}/books')
  Future<PostApiBookshelfBookshelfIdBooksResponse> addBookToMyBookshelf({
    @Path('bookshelfId') required String bookshelfId,
    @Body() required BookshelfAddRequest body,
  });

  /// 내 책장 한 개의 요약 조회.
  ///
  /// 선택한 책장의 이름·현재 책 수·생성 시각·템플릿 키·표지 색상을 조회합니다. 없거나 다른 회원의 책장이면 404입니다. 도서 목록은 이 응답에 포함되지 않습니다.
  ///
  /// [bookshelfId] - 내 책장 UUID.
  @GET('/api/bookshelf/{bookshelfId}')
  Future<GetApiBookshelfBookshelfIdResponse> getMyBookshelf({
    @Path('bookshelfId') required String bookshelfId,
  });

  /// 내 책장 삭제.
  ///
  /// 책장과 그 안의 모든 개별 책·메모·첨부 사진을 삭제합니다. 공유 도서 정보와 다른 책장·다른 회원의 개별 책과 메모는 유지합니다. 같은 ISBN을 다시 책장에 추가하면 공유 도서 정보 UUID는 재사용하고 개별 책 UUID는 새로 생성합니다. 존재하지 않거나 다른 회원의 책장은 404입니다.
  ///
  /// [bookshelfId] - 삭제할 내 책장 UUID.
  @DELETE('/api/bookshelf/{bookshelfId}')
  Future<void> deleteMyBookshelf({
    @Path('bookshelfId') required String bookshelfId,
  });

  /// 내 책장 안의 책 상세 조회.
  ///
  /// 선택한 책장에 담긴 책의 제목·저자·표지 URL·설명과 책장 추가 시각을 반환합니다. 내 책장에 담긴 책만 조회하며, 외부 API를 호출하지 않습니다. 상세 화면의 메모 목록은 같은 경로 뒤에 /memos를 붙여 별도로 조회합니다. bookId는 검색 결과 ISBN이 아닌 책장 책 목록 응답의 book.id입니다.
  ///
  /// [bookshelfId] - 내 책장 UUID.
  ///
  /// [bookId] - 저장된 책 UUID.
  @GET('/api/bookshelf/{bookshelfId}/books/{bookId}')
  Future<GetApiBookshelfBookshelfIdBooksBookIdResponse> getBookInMyBookshelf({
    @Path('bookshelfId') required String bookshelfId,
    @Path('bookId') required String bookId,
  });

  /// 선택한 책장에서 책 한 개 빼기.
  ///
  /// 해당 책장에 담긴 개별 책과 그 책에 작성한 메모·첨부 사진을 함께 삭제합니다. 미리보기에 선택된 책이면 해당 배치도 제거합니다. 공유 책 정보와 다른 책장에 담긴 같은 책은 유지합니다. 존재하지 않는 책장·다른 회원의 책장·해당 책장에 없는 책이면 404입니다. bookId에는 ISBN이 아닌 책 목록 응답의 book.id를 사용합니다.
  ///
  /// [bookshelfId] - 내 책장 UUID.
  ///
  /// [bookId] - 저장된 책 UUID. ISBN이 아닙니다.
  @DELETE('/api/bookshelf/{bookshelfId}/books/{bookId}')
  Future<void> removeBookFromMyBookshelf({
    @Path('bookshelfId') required String bookshelfId,
    @Path('bookId') required String bookId,
  });
}
