// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../cellModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CellModelImpl _$$CellModelImplFromJson(Map<String, dynamic> json) =>
    _$CellModelImpl(
      cellId: json['cellId'] as String,
      type: json['type'] as String,
      date: json['date'] as String,
      category: json['category'] as String,
      where: json['where'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
      extra: json['extra'] as String,
    );

Map<String, dynamic> _$$CellModelImplToJson(_$CellModelImpl instance) =>
    <String, dynamic>{
      'cellId': instance.cellId,
      'type': instance.type,
      'date': instance.date,
      'category': instance.category,
      'where': instance.where,
      'name': instance.name,
      'amount': instance.amount,
      'extra': instance.extra,
    };
