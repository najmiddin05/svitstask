import 'package:svitstask/config/constants/apis.dart';
import 'package:svitstask/core/data/data_source/remote/remote_data_source.dart';
import 'package:svitstask/feature/user/domain/model/user_detail/user_detail.dart';
import 'package:svitstask/feature/user/domain/model/user_list/user_list.dart';
import 'package:svitstask/feature/user/domain/repository/user_list_repository.dart';

/// [UserListRepositoryImpl] is an implementation of [UserListRepository]
/// that fetches user data from a remote data source.
class UserListRepositoryImpl implements UserListRepository {
  final RemoteDataSource remoteDS;

  const UserListRepositoryImpl({required this.remoteDS});

  /// Fetches the details of a specific user by ID from the remote data source.
  ///
  /// [id]: The ID of the user to fetch.
  ///
  /// Returns a [UserDetail] containing the user details.
  @override
  Future<UserDetail> fetchUser(String id) async {
    try {
      final response = await remoteDS.request(api: Apis.users, id: id);
      final user = UserDetail.fromJson(response as Map<String, Object?>);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches a list of users with pagination parameters from the remote data source.
  ///
  /// [page]: The page number to fetch.
  /// [perPage]: The number of items per page.
  ///
  /// Returns a [UserList] containing the user data.
  @override
  Future<UserList> fetchUserList(String page, String perPage) async {
    try {
      final response = await remoteDS.request(api: Apis.users, queryParams: {"per_page": perPage, "page": page});
      final userList = UserList.fromJson(response as Map<String, Object?>);
      return userList;
    } catch (e) {
      rethrow;
    }
  }
}
