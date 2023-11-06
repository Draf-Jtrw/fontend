// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Historys _$HistorysFromJson(Map<String, dynamic> json) => Historys()
  ..historys = (json['historys'] as List<dynamic>)
      .map((e) => History.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$HistorysToJson(Historys instance) => <String, dynamic>{
      'historys': instance.historys,
    };
