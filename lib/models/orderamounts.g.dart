// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderamounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderamounts _$OrderamountsFromJson(Map<String, dynamic> json) => Orderamounts()
  ..orderamounts = (json['orderamounts'] as List<dynamic>)
      .map((e) => Orderamount.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$OrderamountsToJson(Orderamounts instance) =>
    <String, dynamic>{
      'orderamounts': instance.orderamounts,
    };
