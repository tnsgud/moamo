// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookMetadata _$BookMetadataFromJson(Map<String, dynamic> json) => BookMetadata(
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
      : BookMetadataCoverImageSource.fromJson(
          json['coverImageSource'] as String,
        ),
  description: json['description'] as String?,
);

Map<String, dynamic> _$BookMetadataToJson(BookMetadata instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publicationDate': instance.publicationDate,
      'kdc': instance.kdc,
      'classificationName': instance.classificationName,
      'coverImageUrl': instance.coverImageUrl,
      'coverImageSource':
          _$BookMetadataCoverImageSourceEnumMap[instance.coverImageSource],
      'description': instance.description,
    };

const _$BookMetadataCoverImageSourceEnumMap = {
  BookMetadataCoverImageSource.nationalLibrary: 'NATIONAL_LIBRARY',
  BookMetadataCoverImageSource.libraryNaru: 'LIBRARY_NARU',
  BookMetadataCoverImageSource.$unknown: r'$unknown',
};
