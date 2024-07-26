import 'package:svitstask/feature/user/domain/model/support/support.dart';
import 'package:svitstask/feature/user/domain/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';
part 'user_detail.g.dart';

@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail({
    required User data,
    required Support support,
  }) = _UserDetail;

  factory UserDetail.fromJson(Map<String, Object?> json) => _$UserDetailFromJson(json);
}
