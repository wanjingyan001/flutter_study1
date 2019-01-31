import 'package:json_annotation/json_annotation.dart';

part 'move_bean.g.dart';

@JsonSerializable()
class MoveBean {
  final int error_code;
  final String reason;
  final List<MoveResult> result;

  MoveBean({this.error_code, this.reason, this.result});

  factory MoveBean.fromJson(Map<String, dynamic> json) =>
      _$MoveBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MoveBeanToJson(this);
}

@JsonSerializable()
class MoveResult {
  final String movieid; //	影片唯一标识ID
  final String actors; //	影片的演员列表。
  final String also_known_as; //	影片的其它名称。
  final String country; //	影片的拍摄国家。
  final String directors; //	影片的导演列表。
  final String film_locations; //	影片的拍摄地。
  final String genres; //	影片的分类。（如：戏剧，战争）
  final String language; //	影片的对白使用的语言。
  final String plot_simple; //	影片的剧情概要。
  final String poster; //影片的海报。
  final String rated; //	影片的分类与评级
  final String rating; //	影片的得分。
  final String rating_count; //	影片的评分人数。
  final int release_date; //	影片的上映时间。
  final String runtime; //	影片的持续时间。
  final String title; //影片的名称。
  final String type; //	影片类型.
  final String writers; //	影片的编剧列表。

  MoveResult(
      {this.movieid,
      this.actors,
      this.also_known_as,
      this.country,
      this.directors,
      this.film_locations,
      this.genres,
      this.language,
      this.plot_simple,
      this.poster,
      this.rated,
      this.rating,
      this.rating_count,
      this.release_date,
      this.runtime,
      this.title,
      this.type,
      this.writers});

  factory MoveResult.fromJson(Map<String, dynamic> json) =>
      _$MoveResultFromJson(json);

  Map<String, dynamic> toJson() => _$MoveResultToJson(this);
}
