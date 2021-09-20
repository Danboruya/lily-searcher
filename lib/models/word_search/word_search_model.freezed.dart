// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'word_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordSearchModel _$WordSearchModelFromJson(Map<String, dynamic> json) {
  return _WordSearchModel.fromJson(json);
}

/// @nodoc
class _$WordSearchModelTearOff {
  const _$WordSearchModelTearOff();

  _WordSearchModel call(
      {required Map<String, dynamic> results,
      List<Map<String, dynamic>>? resultList}) {
    return _WordSearchModel(
      results: results,
      resultList: resultList,
    );
  }

  WordSearchModel fromJson(Map<String, Object> json) {
    return WordSearchModel.fromJson(json);
  }
}

/// @nodoc
const $WordSearchModel = _$WordSearchModelTearOff();

/// @nodoc
mixin _$WordSearchModel {
  Map<String, dynamic> get results => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get resultList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordSearchModelCopyWith<WordSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSearchModelCopyWith<$Res> {
  factory $WordSearchModelCopyWith(
          WordSearchModel value, $Res Function(WordSearchModel) then) =
      _$WordSearchModelCopyWithImpl<$Res>;
  $Res call(
      {Map<String, dynamic> results, List<Map<String, dynamic>>? resultList});
}

/// @nodoc
class _$WordSearchModelCopyWithImpl<$Res>
    implements $WordSearchModelCopyWith<$Res> {
  _$WordSearchModelCopyWithImpl(this._value, this._then);

  final WordSearchModel _value;
  // ignore: unused_field
  final $Res Function(WordSearchModel) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? resultList = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      resultList: resultList == freezed
          ? _value.resultList
          : resultList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
abstract class _$WordSearchModelCopyWith<$Res>
    implements $WordSearchModelCopyWith<$Res> {
  factory _$WordSearchModelCopyWith(
          _WordSearchModel value, $Res Function(_WordSearchModel) then) =
      __$WordSearchModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, dynamic> results, List<Map<String, dynamic>>? resultList});
}

/// @nodoc
class __$WordSearchModelCopyWithImpl<$Res>
    extends _$WordSearchModelCopyWithImpl<$Res>
    implements _$WordSearchModelCopyWith<$Res> {
  __$WordSearchModelCopyWithImpl(
      _WordSearchModel _value, $Res Function(_WordSearchModel) _then)
      : super(_value, (v) => _then(v as _WordSearchModel));

  @override
  _WordSearchModel get _value => super._value as _WordSearchModel;

  @override
  $Res call({
    Object? results = freezed,
    Object? resultList = freezed,
  }) {
    return _then(_WordSearchModel(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      resultList: resultList == freezed
          ? _value.resultList
          : resultList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordSearchModel
    with DiagnosticableTreeMixin
    implements _WordSearchModel {
  const _$_WordSearchModel({required this.results, this.resultList});

  factory _$_WordSearchModel.fromJson(Map<String, dynamic> json) =>
      _$$_WordSearchModelFromJson(json);

  @override
  final Map<String, dynamic> results;
  @override
  final List<Map<String, dynamic>>? resultList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WordSearchModel(results: $results, resultList: $resultList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WordSearchModel'))
      ..add(DiagnosticsProperty('results', results))
      ..add(DiagnosticsProperty('resultList', resultList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WordSearchModel &&
            (identical(other.results, results) ||
                const DeepCollectionEquality()
                    .equals(other.results, results)) &&
            (identical(other.resultList, resultList) ||
                const DeepCollectionEquality()
                    .equals(other.resultList, resultList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(results) ^
      const DeepCollectionEquality().hash(resultList);

  @JsonKey(ignore: true)
  @override
  _$WordSearchModelCopyWith<_WordSearchModel> get copyWith =>
      __$WordSearchModelCopyWithImpl<_WordSearchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordSearchModelToJson(this);
  }
}

abstract class _WordSearchModel implements WordSearchModel {
  const factory _WordSearchModel(
      {required Map<String, dynamic> results,
      List<Map<String, dynamic>>? resultList}) = _$_WordSearchModel;

  factory _WordSearchModel.fromJson(Map<String, dynamic> json) =
      _$_WordSearchModel.fromJson;

  @override
  Map<String, dynamic> get results => throw _privateConstructorUsedError;
  @override
  List<Map<String, dynamic>>? get resultList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WordSearchModelCopyWith<_WordSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}
