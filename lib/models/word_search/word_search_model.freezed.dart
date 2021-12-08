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
      {required String uri,
      required String key,
      required String name,
      required String nameKana,
      String? garden,
      String? position}) {
    return _WordSearchModel(
      uri: uri,
      key: key,
      name: name,
      nameKana: nameKana,
      garden: garden,
      position: position,
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
  String get uri => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameKana => throw _privateConstructorUsedError;
  String? get garden => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

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
      {String uri,
      String key,
      String name,
      String nameKana,
      String? garden,
      String? position});
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
    Object? uri = freezed,
    Object? key = freezed,
    Object? name = freezed,
    Object? nameKana = freezed,
    Object? garden = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameKana: nameKana == freezed
          ? _value.nameKana
          : nameKana // ignore: cast_nullable_to_non_nullable
              as String,
      garden: garden == freezed
          ? _value.garden
          : garden // ignore: cast_nullable_to_non_nullable
              as String?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String uri,
      String key,
      String name,
      String nameKana,
      String? garden,
      String? position});
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
    Object? uri = freezed,
    Object? key = freezed,
    Object? name = freezed,
    Object? nameKana = freezed,
    Object? garden = freezed,
    Object? position = freezed,
  }) {
    return _then(_WordSearchModel(
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameKana: nameKana == freezed
          ? _value.nameKana
          : nameKana // ignore: cast_nullable_to_non_nullable
              as String,
      garden: garden == freezed
          ? _value.garden
          : garden // ignore: cast_nullable_to_non_nullable
              as String?,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordSearchModel
    with DiagnosticableTreeMixin
    implements _WordSearchModel {
  const _$_WordSearchModel(
      {required this.uri,
      required this.key,
      required this.name,
      required this.nameKana,
      this.garden,
      this.position});

  factory _$_WordSearchModel.fromJson(Map<String, dynamic> json) =>
      _$$_WordSearchModelFromJson(json);

  @override
  final String uri;
  @override
  final String key;
  @override
  final String name;
  @override
  final String nameKana;
  @override
  final String? garden;
  @override
  final String? position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WordSearchModel(uri: $uri, key: $key, name: $name, nameKana: $nameKana, garden: $garden, position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WordSearchModel'))
      ..add(DiagnosticsProperty('uri', uri))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('nameKana', nameKana))
      ..add(DiagnosticsProperty('garden', garden))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WordSearchModel &&
            (identical(other.uri, uri) ||
                const DeepCollectionEquality().equals(other.uri, uri)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.nameKana, nameKana) ||
                const DeepCollectionEquality()
                    .equals(other.nameKana, nameKana)) &&
            (identical(other.garden, garden) ||
                const DeepCollectionEquality().equals(other.garden, garden)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uri) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(nameKana) ^
      const DeepCollectionEquality().hash(garden) ^
      const DeepCollectionEquality().hash(position);

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
      {required String uri,
      required String key,
      required String name,
      required String nameKana,
      String? garden,
      String? position}) = _$_WordSearchModel;

  factory _WordSearchModel.fromJson(Map<String, dynamic> json) =
      _$_WordSearchModel.fromJson;

  @override
  String get uri => throw _privateConstructorUsedError;
  @override
  String get key => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get nameKana => throw _privateConstructorUsedError;
  @override
  String? get garden => throw _privateConstructorUsedError;
  @override
  String? get position => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WordSearchModelCopyWith<_WordSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}
