import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:svitstask/feature/user/domain/model/support/support.dart';
import 'package:svitstask/feature/user/domain/model/user/user.dart';

part 'user_list.freezed.dart';
part 'user_list.g.dart';

@freezed
class UserList with _$UserList {
  const factory UserList({
    required int page,
    @JsonKey(name: 'per_page') required int perPage,
    required int total,
    @JsonKey(name: 'total_pages') required int totalPages,
    required List<User> data,
    required Support support,
  }) = _UserList;

  factory UserList.fromJson(Map<String, Object?> json) => _$UserListFromJson(json);
}
