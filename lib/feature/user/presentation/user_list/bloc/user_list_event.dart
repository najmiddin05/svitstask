part of 'user_list_bloc.dart';

/// [UserListEvent] is the base class for all events related to the user list.
sealed class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object?> get props => [];
}

/// [FetchAllUserListEvent] is an event to fetch the user list.
/// It can optionally refresh the list by clearing the current items.
class FetchAllUserListEvent extends UserListEvent {
  final bool refresh;

  const FetchAllUserListEvent({this.refresh = false});

  @override
  List<Object?> get props => [refresh];
}
