part of 'user_detail_bloc.dart';

/// [UserDetailEvent] is the base class for all events related to the user detail.
sealed class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object?> get props => [];
}

/// [FetchOneUserEvent] is an event to fetch the details of a specific user.
class FetchOneUserEvent extends UserDetailEvent {
  final int id;

  const FetchOneUserEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
