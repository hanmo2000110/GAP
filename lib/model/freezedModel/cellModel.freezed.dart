// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../cellModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CellModel _$CellModelFromJson(Map<String, dynamic> json) {
  return _CellModel.fromJson(json);
}

/// @nodoc
mixin _$CellModel {
  String get cellId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get where => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get extra => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CellModelCopyWith<CellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CellModelCopyWith<$Res> {
  factory $CellModelCopyWith(CellModel value, $Res Function(CellModel) then) =
      _$CellModelCopyWithImpl<$Res, CellModel>;
  @useResult
  $Res call(
      {String cellId,
      String type,
      String date,
      String category,
      String where,
      String name,
      int amount,
      String extra});
}

/// @nodoc
class _$CellModelCopyWithImpl<$Res, $Val extends CellModel>
    implements $CellModelCopyWith<$Res> {
  _$CellModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cellId = null,
    Object? type = null,
    Object? date = null,
    Object? category = null,
    Object? where = null,
    Object? name = null,
    Object? amount = null,
    Object? extra = null,
  }) {
    return _then(_value.copyWith(
      cellId: null == cellId
          ? _value.cellId
          : cellId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      where: null == where
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CellModelImplCopyWith<$Res>
    implements $CellModelCopyWith<$Res> {
  factory _$$CellModelImplCopyWith(
          _$CellModelImpl value, $Res Function(_$CellModelImpl) then) =
      __$$CellModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cellId,
      String type,
      String date,
      String category,
      String where,
      String name,
      int amount,
      String extra});
}

/// @nodoc
class __$$CellModelImplCopyWithImpl<$Res>
    extends _$CellModelCopyWithImpl<$Res, _$CellModelImpl>
    implements _$$CellModelImplCopyWith<$Res> {
  __$$CellModelImplCopyWithImpl(
      _$CellModelImpl _value, $Res Function(_$CellModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cellId = null,
    Object? type = null,
    Object? date = null,
    Object? category = null,
    Object? where = null,
    Object? name = null,
    Object? amount = null,
    Object? extra = null,
  }) {
    return _then(_$CellModelImpl(
      cellId: null == cellId
          ? _value.cellId
          : cellId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      where: null == where
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CellModelImpl implements _CellModel {
  _$CellModelImpl(
      {required this.cellId,
      required this.type,
      required this.date,
      required this.category,
      required this.where,
      required this.name,
      required this.amount,
      required this.extra});

  factory _$CellModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CellModelImplFromJson(json);

  @override
  final String cellId;
  @override
  final String type;
  @override
  final String date;
  @override
  final String category;
  @override
  final String where;
  @override
  final String name;
  @override
  final int amount;
  @override
  final String extra;

  @override
  String toString() {
    return 'CellModel(cellId: $cellId, type: $type, date: $date, category: $category, where: $where, name: $name, amount: $amount, extra: $extra)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CellModelImpl &&
            (identical(other.cellId, cellId) || other.cellId == cellId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.where, where) || other.where == where) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, cellId, type, date, category, where, name, amount, extra);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CellModelImplCopyWith<_$CellModelImpl> get copyWith =>
      __$$CellModelImplCopyWithImpl<_$CellModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CellModelImplToJson(
      this,
    );
  }
}

abstract class _CellModel implements CellModel {
  factory _CellModel(
      {required final String cellId,
      required final String type,
      required final String date,
      required final String category,
      required final String where,
      required final String name,
      required final int amount,
      required final String extra}) = _$CellModelImpl;

  factory _CellModel.fromJson(Map<String, dynamic> json) =
      _$CellModelImpl.fromJson;

  @override
  String get cellId;
  @override
  String get type;
  @override
  String get date;
  @override
  String get category;
  @override
  String get where;
  @override
  String get name;
  @override
  int get amount;
  @override
  String get extra;
  @override
  @JsonKey(ignore: true)
  _$$CellModelImplCopyWith<_$CellModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
