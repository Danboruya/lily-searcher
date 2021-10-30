import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_search_model.freezed.dart';

part 'word_search_model.g.dart';

@freezed
class WordSearchModel with _$WordSearchModel {
  const factory WordSearchModel({
    required String uri,
    required String key,
    required String name,
    required String nameKana,
    String? garden,
    String? position,
  }) = _WordSearchModel;

  factory WordSearchModel.fromJson(Map<String, dynamic> json) =>
      _$WordSearchModelFromJson(json);
}
