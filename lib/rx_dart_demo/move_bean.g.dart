// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveBean _$MoveBeanFromJson(Map<String, dynamic> json) {
  return MoveBean(
      error_code: json['error_code'] as int,
      reason: json['reason'] as String,
      result: (json['result'] as List)
          ?.map((e) =>
              e == null ? null : MoveResult.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MoveBeanToJson(MoveBean instance) => <String, dynamic>{
      'error_code': instance.error_code,
      'reason': instance.reason,
      'result': instance.result
    };

MoveResult _$MoveResultFromJson(Map<String, dynamic> json) {
  return MoveResult(
      movieid: json['movieid'] as String,
      actors: json['actors'] as String,
      also_known_as: json['also_known_as'] as String,
      country: json['country'] as String,
      directors: json['directors'] as String,
      film_locations: json['film_locations'] as String,
      genres: json['genres'] as String,
      language: json['language'] as String,
      plot_simple: json['plot_simple'] as String,
      poster: json['poster'] as String,
      rated: json['rated'] as String,
      rating: json['rating'] as String,
      rating_count: json['rating_count'] as String,
      release_date: json['release_date'] as int,
      runtime: json['runtime'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      writers: json['writers'] as String);
}

Map<String, dynamic> _$MoveResultToJson(MoveResult instance) =>
    <String, dynamic>{
      'movieid': instance.movieid,
      'actors': instance.actors,
      'also_known_as': instance.also_known_as,
      'country': instance.country,
      'directors': instance.directors,
      'film_locations': instance.film_locations,
      'genres': instance.genres,
      'language': instance.language,
      'plot_simple': instance.plot_simple,
      'poster': instance.poster,
      'rated': instance.rated,
      'rating': instance.rating,
      'rating_count': instance.rating_count,
      'release_date': instance.release_date,
      'runtime': instance.runtime,
      'title': instance.title,
      'type': instance.type,
      'writers': instance.writers
    };
