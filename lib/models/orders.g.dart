// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders()
  ..orders = (json['orders'] as List<dynamic>)
      .map((e) => Order.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'orders': instance.orders,
    };
