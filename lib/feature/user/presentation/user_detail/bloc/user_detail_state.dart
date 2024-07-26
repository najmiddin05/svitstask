part of 'user_detail_bloc.dart';

/// [UserDetailState] represents the state of the user detail page.
/// It contains information about the status, data, and message.
class UserDetailState extends Equatable {
  const UserDetailState({
    this.status = UserDetailStatus.initial,
    this.message,
    this.data,
  });

  /// The current status of the user detail.
  final UserDetailStatus status;

  /// The user detail data.
  final UserDetail? data;

  /// The message related to the current state.
  final String? message;

  @override
  List<Object?> get props => [status, message, data];

  /// Creates a copy of the current state with updated values.
  UserDetailState copyWith({
    UserDetailStatus? status,
    UserDetail? data,
    String? message,
  }) {
    return UserDetailState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}

/// The possible statuses for the user detail.
enum UserDetailStatus {
  initial,
  loading,
  failure,
  success,
}
