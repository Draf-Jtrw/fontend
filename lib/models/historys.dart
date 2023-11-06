import 'package:json_annotation/json_annotation.dart';
import "history.dart";
part 'historys.g.dart';

@JsonSerializable()
class Historys {
  Historys();

  late List<History> historys;
  late List<History> historyCan;
  
  factory Historys.fromJson(Map<String,dynamic> json) => _$HistorysFromJson(json);
  Map<String, dynamic> toJson() => _$HistorysToJson(this);
}
