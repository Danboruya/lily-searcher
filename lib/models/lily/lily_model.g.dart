// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lily_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LilyModel _$$_LilyModelFromJson(Map<String, dynamic> json) => _$_LilyModel(
      key: json['key'] as String,
      name: json['name'] as String,
      nameKana: json['nameKana'] as String,
      givenNameKana: json['givenNameKana'] as String?,
      age: json['age'] as int?,
      birthDay: json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      rareSkill: json['rareSkill'] as String?,
      subSkill: json['subSkill'] as String?,
      isBoosted: json['isBoosted'] as bool?,
      boostedSkill: json['boostedSkill'] as String?,
      garden: json['garden'] as String?,
      grade: json['grade'] as int?,
      legion: json['legion'] as String?,
      legionJobTitle: json['legionJobTitle'] as String?,
      position: json['position'] as String?,
      type: json['type'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      bloodType: json['bloodType'] as String?,
      lifeStatus: json['lifeStatus'] as String?,
      charm: json['charm'] as String?,
      birthPlace: json['birthPlace'] as String?,
      anotherName: json['anotherName'] as String?,
    );

Map<String, dynamic> _$$_LilyModelToJson(_$_LilyModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'nameKana': instance.nameKana,
      'givenNameKana': instance.givenNameKana,
      'age': instance.age,
      'birthDay': instance.birthDay?.toIso8601String(),
      'rareSkill': instance.rareSkill,
      'subSkill': instance.subSkill,
      'isBoosted': instance.isBoosted,
      'boostedSkill': instance.boostedSkill,
      'garden': instance.garden,
      'grade': instance.grade,
      'legion': instance.legion,
      'legionJobTitle': instance.legionJobTitle,
      'position': instance.position,
      'type': instance.type,
      'height': instance.height,
      'weight': instance.weight,
      'bloodType': instance.bloodType,
      'lifeStatus': instance.lifeStatus,
      'charm': instance.charm,
      'birthPlace': instance.birthPlace,
      'anotherName': instance.anotherName,
    };
