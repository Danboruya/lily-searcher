import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'raw_response_model.freezed.dart';
part 'raw_response_model.g.dart';

@freezed
class RawResponseModel with _$RawResponseModel {
  const factory RawResponseModel ({
    required final Map<String, dynamic> graph,
    required final Map<String, dynamic> context,
  }) = _RawResponseModel;

  factory RawResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RawResponseModelFromJson(json);
}