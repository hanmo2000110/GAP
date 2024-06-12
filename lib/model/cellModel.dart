import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezedModel/cellModel.freezed.dart';
part 'freezedModel/cellModel.g.dart';

@freezed
class CellModel with _$CellModel {
  factory CellModel({
    required String type,
    required String date,
    required String category,
    required String where,
    required String name,
    required int amount,
    required String extra,
  }) = _CellModel;

  factory CellModel.fromJson(Map<String, dynamic> json) =>
      _$CellModelFromJson(json);
}
