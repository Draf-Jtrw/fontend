// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Foods _$FoodsFromJson(Map<String, dynamic> json) => Foods()
  ..foods = (json['foods'] as List<dynamic>)
      .map((e) => Food.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$FoodsToJson(Foods instance) => <String, dynamic>{
      'foods': instance.foods,
    };
