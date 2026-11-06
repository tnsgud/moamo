/// 서버가 준 분류 이름을 화면에 보여 줄 글자로 바꾼다. 보여 줄 게 없으면 null.
///
/// 분류가 비어 있으면 서버가 `"null > null > null"`처럼 보내기도 해서,
/// 모든 단계가 비었거나 `null`이면 없는 것으로 본다.
String? bookCategoryLabel(String? raw) {
  if (raw == null) return null;
  final parts = raw
      .split('>')
      .map((p) => p.trim())
      .where((p) => p.isNotEmpty && p != 'null');
  return parts.isEmpty ? null : parts.join(' > ');
}
