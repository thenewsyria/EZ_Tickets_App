import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
abstract class RoleModel with _$RoleModel {

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RoleModel({
    required int roleId,
    required String fullName,
    required int age,
    required String pictureUrl,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}