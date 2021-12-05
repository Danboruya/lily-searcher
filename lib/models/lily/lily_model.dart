import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lily_model.freezed.dart';
part 'lily_model.g.dart';

/// Detailed model representing Lily's information
@freezed
class LilyModel with _$LilyModel {
  const factory LilyModel({
    required String key,
    required String name,
    required String nameKana,
    String? givenNameKana,
    int? age,
    DateTime? birthDay,
    String? rareSkill,
    String? subSkill,
    bool? isBoosted,
    String? boostedSkill,
    String? garden,
    String? grade,
    String? legion,
    String? legionJobTitle,
    String? position,
    String? type,
    double? height,
    double? weight,
    String? bloodType,
    String? lifeStatus,
    String? charm,
    String? birthPlace,
    String? anotherName,
  }) = _LilyModel;

  factory LilyModel.fromJson(Map<String, dynamic> json) =>
      _$LilyModelFromJson(json);
}