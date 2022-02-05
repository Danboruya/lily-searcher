import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'charm_list_model.freezed.dart';
part 'charm_list_model.g.dart';

/// Charm model for list view.
@freezed
class CharmListModel with _$CharmListModel {
  const factory CharmListModel({
    required String key,
    required String name,
    int? generation,
    String? seriesName,
    String? productId,
  }) = _CharmListModel;

  factory CharmListModel.fromJson(Map<String, dynamic> json) =>
      _$CharmListModelFromJson(json);
}