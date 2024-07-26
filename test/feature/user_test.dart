import 'package:flutter_test/flutter_test.dart';
import 'package:svitstask/config/constants/apis.dart';
import 'package:svitstask/config/logs/app_dio_interceptor.dart';
import 'package:svitstask/core/data/data_source/remote/remote_data_source.dart';
import 'package:svitstask/feature/user/domain/model/user_detail/user_detail.dart';
import 'package:svitstask/feature/user/domain/model/user_list/user_list.dart';

void main() {
  /// Group of tests related to user functionalities.
  group("User test", () {
    /// Instance of the remote data source with a custom Dio interceptor.
    final service = RemoteDataSource(interceptor: const DioInterceptor());

    /// Test for fetching all users.
    test("User test fetch all users", () async {
      /// Make a request to fetch users with pagination parameters.
      final response = await service.request(
        api: Apis.users,
        queryParams: {"per_page": '6', "page": '1'},
      );

      try {
        /// Parse the response into a [UserList] object.
        final userList = UserList.fromJson(response as Map<String, Object?>);
        return userList;
      } catch (e) {
        rethrow;
      }
    });

    /// Test for fetching a single user by ID.
    test("User test fetch one user", () async {
      /// Make a request to fetch a user by ID.
      final response = await service.request(api: Apis.users, id: '1');

      try {
        /// Parse the response into a [UserDetail] object.
        final user = UserDetail.fromJson(response as Map<String, Object?>);
        return user;
      } catch (e) {
        rethrow;
      }
    });
  });
}
