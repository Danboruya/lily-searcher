// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charm_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharmListModel _$$_CharmListModelFromJson(Map<String, dynamic> json) =>
    _$_CharmListModel(
      key: json['key'] as String,
      name: json['name'] as String,
      generation: json['generation'] as int?,
      seriesName: json['seriesName'] as String?,
      productId: json['productId'] as String?,
    );

Map<String, dynamic> _$$_CharmListModelToJson(_$_CharmListModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'generation': instance.generation,
      'seriesName': instance.seriesName,
      'productId': instance.productId,
    };
