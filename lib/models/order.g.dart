// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order()
  ..oid = json['oid'] as num
  ..cusid = json['cusid'] as String
  ..address = json['address'] as String
  ..phone = json['phone'] as num
  ..name = json['name'] as String
  ..sumprice = json['sumprice'] as num;

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'oid': instance.oid,
      'cusid': instance.cusid,
      'address': instance.address,
      'phone': instance.phone,
      'name': instance.name,
      'sumprice': instance.sumprice,
    };
