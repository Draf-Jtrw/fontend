// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Basket _$BasketFromJson(Map<String, dynamic> json) => Basket()
  ..bid = json['bid'] as num
  ..cusid = json['cusid'] as num
  ..fid = json['fid'] as num
  ..amount = json['amount'] as num
  ..price = json['price'] as num
  ..pic = json['pic'] as String
  ..name = json['name'] as String;

Map<String, dynamic> _$BasketToJson(Basket instance) => <String, dynamic>{
      'bid': instance.bid,
      'cusid': instance.cusid,
      'fid': instance.fid,
      'amount': instance.amount,
      'price': instance.price,
      'pic': instance.pic,
      'name': instance.name,
    };
