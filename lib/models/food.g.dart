// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food()
  ..fid = json['fid'] as num
  ..name = json['name'] as String
  ..type = json['type'] as String
  ..price = json['price'] as num
  ..pic = json['pic'] as String;

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'fid': instance.fid,
      'name': instance.name,
      'type': instance.type,
      'price': instance.price,
      'pic': instance.pic,
    };
