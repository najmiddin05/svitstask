import 'package:svitstask/feature/user/domain/model/user_detail/user_detail.dart';
import 'package:svitstask/feature/user/domain/model/user_list/user_list.dart';

/// [UserListRepository] is an abstract class that defines the contract
/// for fetching user lists and user details.
abstract class UserListRepository {
  const UserListRepository();

  /// Fetches a list of users with pagination parameters.
  ///
  /// [page]: The page number to fetch.
  /// [perPage]: The number of items per page.
  ///
  /// Returns a [UserList] containing the user data.
  Future<UserList> fetchUserList(String page, String perPage);

  /// Fetches the details of a specific user by ID.
  ///
  /// [id]: The ID of the user to fetch.
  ///
  /// Returns a [UserDetail] containing the user details.
  Future<UserDetail> fetchUser(String id);
}
