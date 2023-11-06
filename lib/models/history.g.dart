// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History()
  ..hid = json['hid'] as num
  ..name = json['name'] as String
  ..sumprice = json['sumprice'] as num;

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'hid': instance.hid,
      'name': instance.name,
      'sumprice': instance.sumprice,
    };
