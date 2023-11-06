// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderamount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderamount _$OrderamountFromJson(Map<String, dynamic> json) => Orderamount()
  ..oid = json['oid'] as num
  ..fid = json['fid'] as num
  ..amount = json['amount'] as num
  ..price = json['price'] as num
  ..pic = json['pic'] as String
  ..name = json['name'] as String;

Map<String, dynamic> _$OrderamountToJson(Orderamount instance) =>
    <String, dynamic>{
      'oid': instance.oid,
      'fid': instance.fid,
      'amount': instance.amount,
      'price': instance.price,
      'pic': instance.pic,
      'name': instance.name,
    };
