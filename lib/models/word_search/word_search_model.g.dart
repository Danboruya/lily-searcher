// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordSearchModel _$$_WordSearchModelFromJson(Map<String, dynamic> json) =>
    _$_WordSearchModel(
      results: json['results'] as Map<String, dynamic>,
      resultList: (json['resultList'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_WordSearchModelToJson(_$_WordSearchModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'resultList': instance.resultList,
    };
