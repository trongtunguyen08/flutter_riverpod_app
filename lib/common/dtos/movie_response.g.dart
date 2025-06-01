// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    _MovieResponse(
      page: (json['page'] as num).toInt(),
      results:
          (json['results'] as List<dynamic>)
              .map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalResults: (json['totalResults'] as num).toInt(),
    );

Map<String, dynamic> _$MovieResponseToJson(_MovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };

_Result _$ResultFromJson(Map<String, dynamic> json) => _Result(
  adult: json['adult'] as bool,
  backdropPath: json['backdropPath'] as String,
  genreIds:
      (json['genreIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  id: (json['id'] as num).toInt(),
  originalLanguage: json['originalLanguage'] as String,
  originalTitle: json['originalTitle'] as String,
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  posterPath: json['posterPath'] as String,
  releaseDate: DateTime.parse(json['releaseDate'] as String),
  title: json['title'] as String,
  video: json['video'] as bool,
  voteAverage: (json['voteAverage'] as num).toDouble(),
  voteCount: (json['voteCount'] as num).toInt(),
);

Map<String, dynamic> _$ResultToJson(_Result instance) => <String, dynamic>{
  'adult': instance.adult,
  'backdropPath': instance.backdropPath,
  'genreIds': instance.genreIds,
  'id': instance.id,
  'originalLanguage': instance.originalLanguage,
  'originalTitle': instance.originalTitle,
  'overview': instance.overview,
  'popularity': instance.popularity,
  'posterPath': instance.posterPath,
  'releaseDate': instance.releaseDate.toIso8601String(),
  'title': instance.title,
  'video': instance.video,
  'voteAverage': instance.voteAverage,
  'voteCount': instance.voteCount,
};
