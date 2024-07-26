/// [Apis] is a sealed class that defines the API endpoints used in the application.
sealed class Apis {
  /// The base URL for the API.
  static const String baseUrl = 'https://reqres.in/';

  /// The endpoint for fetching users.
  static const String users = '/api/users';
}
