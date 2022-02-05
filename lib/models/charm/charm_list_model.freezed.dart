// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'charm_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharmListModel _$CharmListModelFromJson(Map<String, dynamic> json) {
  return _CharmListModel.fromJson(json);
}

/// @nodoc
class _$CharmListModelTearOff {
  const _$CharmListModelTearOff();

  _CharmListModel call(
      {required String key,
      required String name,
      int? generation,
      String? seriesName,
      String? productId}) {
    return _CharmListModel(
      key: key,
      name: name,
      generation: generation,
      seriesName: seriesName,
      productId: productId,
    );
  }

  CharmListModel fromJson(Map<String, Object?> json) {
    return CharmListModel.fromJson(json);
  }
}

/// @nodoc
const $CharmListModel = _$CharmListModelTearOff();

/// @nodoc
mixin _$CharmListModel {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get generation => throw _privateConstructorUsedError;
  String? get seriesName => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharmListModelCopyWith<CharmListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharmListModelCopyWith<$Res> {
  factory $CharmListModelCopyWith(
          CharmListModel value, $Res Function(CharmListModel) then) =
      _$CharmListModelCopyWithImpl<$Res>;
  $Res call(
      {String key,
      String name,
      int? generation,
      String? seriesName,
      String? productId});
}

/// @nodoc
class _$CharmListModelCopyWithImpl<$Res>
    implements $CharmListModelCopyWith<$Res> {
  _$CharmListModelCopyWithImpl(this._value, this._then);

  final CharmListModel _value;
  // ignore: unused_field
  final $Res Function(CharmListModel) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? generation = freezed,
    Object? seriesName = freezed,
    Object? productId = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      generation: generation == freezed
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int?,
      seriesName: seriesName == freezed
          ? _value.seriesName
          : seriesName // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CharmListModelCopyWith<$Res>
    implements $CharmListModelCopyWith<$Res> {
  factory _$CharmListModelCopyWith(
          _CharmListModel value, $Res Function(_CharmListModel) then) =
      __$CharmListModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String key,
      String name,
      int? generation,
      String? seriesName,
      String? productId});
}

/// @nodoc
class __$CharmListModelCopyWithImpl<$Res>
    extends _$CharmListModelCopyWithImpl<$Res>
    implements _$CharmListModelCopyWith<$Res> {
  __$CharmListModelCopyWithImpl(
      _CharmListModel _value, $Res Function(_CharmListModel) _then)
      : super(_value, (v) => _then(v as _CharmListModel));

  @override
  _CharmListModel get _value => super._value as _CharmListModel;

  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? generation = freezed,
    Object? seriesName = freezed,
    Object? productId = freezed,
  }) {
    return _then(_CharmListModel(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      generation: generation == freezed
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int?,
      seriesName: seriesName == freezed
          ? _value.seriesName
          : seriesName // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharmListModel
    with DiagnosticableTreeMixin
    implements _CharmListModel {
  const _$_CharmListModel(
      {required this.key,
      required this.name,
      this.generation,
      this.seriesName,
      this.productId});

  factory _$_CharmListModel.fromJson(Map<String, dynamic> json) =>
      _$$_CharmListModelFromJson(json);

  @override
  final String key;
  @override
  final String name;
  @override
  final int? generation;
  @override
  final String? seriesName;
  @override
  final String? productId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CharmListModel(key: $key, name: $name, generation: $generation, seriesName: $seriesName, productId: $productId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CharmListModel'))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('generation', generation))
      ..add(DiagnosticsProperty('seriesName', seriesName))
      ..add(DiagnosticsProperty('productId', productId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CharmListModel &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.generation, generation) &&
            const DeepCollectionEquality()
                .equals(other.seriesName, seriesName) &&
            const DeepCollectionEquality().equals(other.productId, productId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(generation),
      const DeepCollectionEquality().hash(seriesName),
      const DeepCollectionEquality().hash(productId));

  @JsonKey(ignore: true)
  @override
  _$CharmListModelCopyWith<_CharmListModel> get copyWith =>
      __$CharmListModelCopyWithImpl<_CharmListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharmListModelToJson(this);
  }
}

abstract class _CharmListModel implements CharmListModel {
  const factory _CharmListModel(
      {required String key,
      required String name,
      int? generation,
      String? seriesName,
      String? productId}) = _$_CharmListModel;

  factory _CharmListModel.fromJson(Map<String, dynamic> json) =
      _$_CharmListModel.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  int? get generation;
  @override
  String? get seriesName;
  @override
  String? get productId;
  @override
  @JsonKey(ignore: true)
  _$CharmListModelCopyWith<_CharmListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
