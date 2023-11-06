import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History {
  History();

  late num hid;
  late String name;
  late num sumprice;
  
  factory History.fromJson(Map<String,dynamic> json) => _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
