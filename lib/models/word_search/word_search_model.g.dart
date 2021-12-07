// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordSearchModel _$$_WordSearchModelFromJson(Map<String, dynamic> json) =>
    _$_WordSearchModel(
      uri: json['uri'] as String,
      key: json['key'] as String,
      name: json['name'] as String,
      nameKana: json['nameKana'] as String?,
      garden: json['garden'] as String?,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$$_WordSearchModelToJson(_$_WordSearchModel instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'key': instance.key,
      'name': instance.name,
      'nameKana': instance.nameKana,
      'garden': instance.garden,
      'position': instance.position,
    };
