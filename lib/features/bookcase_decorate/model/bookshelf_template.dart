/// 책장 템플릿 (서버 templateKey, 화면 이름). 키는 프런트 자산 식별값이라 여기서 정한다.
/// 첫 번째가 기본 템플릿이고 서버 기본값(DEFAULT)과 같다.
const bookshelfTemplates = [
  ('DEFAULT', '기본'),
  ('FULL', '책 한가득'),
  ('SUMMER', '여름 책장'),
  ('MINIMAL', '미니멀'),
  ('MAXIMAL', '맥시멀'),
];

/// 템플릿 키의 화면 이름. 모르는 키면 기본.
String bookshelfTemplateName(String key) => bookshelfTemplates
    .firstWhere((t) => t.$1 == key, orElse: () => bookshelfTemplates.first)
    .$2;
