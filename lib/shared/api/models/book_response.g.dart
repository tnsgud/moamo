// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
  id: json['id'] as String,
  isbn: json['isbn'] as String,
  title: json['title'] as String,
  authors: json['authors'] as String?,
  publisher: json['publisher'] as String?,
  publicationDate: json['publicationDate'] as String?,
  kdc: json['kdc'] as String?,
  classificationName: json['classificationName'] as String?,
  coverImageUrl: json['coverImageUrl'] as String?,
  coverImageSource: json['coverImageSource'] == null
      ? null
      : BookResponseCoverImageSource.fromJson(
          json['coverImageSource'] as String,
        ),
  description: json['description'] as String?,
);

Map<String, dynamic> _$BookResponseToJson(BookResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isbn': instance.isbn,
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publicationDate': instance.publicationDate,
      'kdc': instance.kdc,
      'classificationName': instance.classificationName,
      'coverImageUrl': instance.coverImageUrl,
      'coverImageSource':
          _$BookResponseCoverImageSourceEnumMap[instance.coverImageSource],
      'description': instance.description,
    };

const _$BookResponseCoverImageSourceEnumMap = {
  BookResponseCoverImageSource.nationalLibrary: 'NATIONAL_LIBRARY',
  BookResponseCoverImageSource.libraryNaru: 'LIBRARY_NARU',
  BookResponseCoverImageSource.$unknown: r'$unknown',
};
