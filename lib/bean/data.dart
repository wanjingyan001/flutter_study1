import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(nullable: false)
class Data {
  String by;
  int descendants;
  int id;
  List<int> kids;
  int score;
  int time;
  String title;
  String type;
  String url;

  Data(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.score,
      this.time,
      this.title,
      this.type,
      this.url});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
