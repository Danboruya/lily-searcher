// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'raw_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RawResponseModel _$RawResponseModelFromJson(Map<String, dynamic> json) {
  return _RawResponseModel.fromJson(json);
}

/// @nodoc
class _$RawResponseModelTearOff {
  const _$RawResponseModelTearOff();

  _RawResponseModel call(
      {required Map<String, dynamic> graph,
      required Map<String, dynamic> context}) {
    return _RawResponseModel(
      graph: graph,
      context: context,
    );
  }

  RawResponseModel fromJson(Map<String, Object?> json) {
    return RawResponseModel.fromJson(json);
  }
}

/// @nodoc
const $RawResponseModel = _$RawResponseModelTearOff();

/// @nodoc
mixin _$RawResponseModel {
  Map<String, dynamic> get graph => throw _privateConstructorUsedError;
  Map<String, dynamic> get context => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RawResponseModelCopyWith<RawResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawResponseModelCopyWith<$Res> {
  factory $RawResponseModelCopyWith(
          RawResponseModel value, $Res Function(RawResponseModel) then) =
      _$RawResponseModelCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> graph, Map<String, dynamic> context});
}

/// @nodoc
class _$RawResponseModelCopyWithImpl<$Res>
    implements $RawResponseModelCopyWith<$Res> {
  _$RawResponseModelCopyWithImpl(this._value, this._then);

  final RawResponseModel _value;
  // ignore: unused_field
  final $Res Function(RawResponseModel) _then;

  @override
  $Res call({
    Object? graph = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      graph: graph == freezed
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$RawResponseModelCopyWith<$Res>
    implements $RawResponseModelCopyWith<$Res> {
  factory _$RawResponseModelCopyWith(
          _RawResponseModel value, $Res Function(_RawResponseModel) then) =
      __$RawResponseModelCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic> graph, Map<String, dynamic> context});
}

/// @nodoc
class __$RawResponseModelCopyWithImpl<$Res>
    extends _$RawResponseModelCopyWithImpl<$Res>
    implements _$RawResponseModelCopyWith<$Res> {
  __$RawResponseModelCopyWithImpl(
      _RawResponseModel _value, $Res Function(_RawResponseModel) _then)
      : super(_value, (v) => _then(v as _RawResponseModel));

  @override
  _RawResponseModel get _value => super._value as _RawResponseModel;

  @override
  $Res call({
    Object? graph = freezed,
    Object? context = freezed,
  }) {
    return _then(_RawResponseModel(
      graph: graph == freezed
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RawResponseModel
    with DiagnosticableTreeMixin
    implements _RawResponseModel {
  const _$_RawResponseModel({required this.graph, required this.context});

  factory _$_RawResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_RawResponseModelFromJson(json);

  @override
  final Map<String, dynamic> graph;
  @override
  final Map<String, dynamic> context;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RawResponseModel(graph: $graph, context: $context)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RawResponseModel'))
      ..add(DiagnosticsProperty('graph', graph))
      ..add(DiagnosticsProperty('context', context));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RawResponseModel &&
            const DeepCollectionEquality().equals(other.graph, graph) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(graph),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$RawResponseModelCopyWith<_RawResponseModel> get copyWith =>
      __$RawResponseModelCopyWithImpl<_RawResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RawResponseModelToJson(this);
  }
}

abstract class _RawResponseModel implements RawResponseModel {
  const factory _RawResponseModel(
      {required Map<String, dynamic> graph,
      required Map<String, dynamic> context}) = _$_RawResponseModel;

  factory _RawResponseModel.fromJson(Map<String, dynamic> json) =
      _$_RawResponseModel.fromJson;

  @override
  Map<String, dynamic> get graph;
  @override
  Map<String, dynamic> get context;
  @override
  @JsonKey(ignore: true)
  _$RawResponseModelCopyWith<_RawResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
