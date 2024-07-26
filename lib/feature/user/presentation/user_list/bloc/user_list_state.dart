part of 'user_list_bloc.dart';

/// [UserListState] represents the state of the user list.
/// It contains information about the status, data, message, items, and pagination.
class UserListState extends Equatable {
  const UserListState({
    this.status = UserListStatus.initial,
    this.data,
    this.message,
    this.items = const [],
    this.isLastPage = false,
    this.page = 1,
    this.perPage = 8,
  });

  /// The current status of the user list.
  final UserListStatus status;

  /// The user list data.
  final UserList? data;

  /// The list of user items.
  final List<User> items;

  /// The message related to the current state.
  final String? message;

  /// Whether the current page is the last page.
  final bool isLastPage;

  /// The current page number.
  final int page;

  /// The number of items per page.
  final int perPage;

  @override
  List<Object?> get props => [status, data, message, items, isLastPage, page, perPage];

  /// Creates a copy of the current state with updated values.
  UserListState copyWith({
    UserListStatus? status,
    UserList? data,
    List<User>? items,
    String? message,
    bool? isLastPage,
    int? page,
    int? perPage,
  }) {
    return UserListState(
      status: status ?? this.status,
      data: data ?? this.data,
      items: items ?? this.items,
      message: message ?? this.message,
      isLastPage: isLastPage ?? this.isLastPage,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  bool get stringify => true;
}

/// The possible statuses for the user list.
enum UserListStatus {
  initial,
  loading,
  failure,
  success,
}
