import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svitstask/config/constants/strings.dart';
import 'package:svitstask/feature/user/domain/model/user/user.dart';
import 'package:svitstask/feature/user/domain/model/user_list/user_list.dart';
import 'package:svitstask/feature/user/domain/repository/user_list_repository.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

/// [UserListBloc] is a BLoC class that manages the state of the user list.
/// It handles events related to fetching the user list and updates the state accordingly.
class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserListRepository repository;

  UserListBloc({required this.repository}) : super(const UserListState()) {
    on<FetchAllUserListEvent>(_fetchAllUserList);
  }

  /// Handles the [FetchAllUserListEvent] to fetch the user list from the repository.
  /// Emits states for loading, success, and failure.
  void _fetchAllUserList(FetchAllUserListEvent event, Emitter<UserListState> emit) async {
    try {
      if (event.refresh) {
        emit(state.copyWith(status: UserListStatus.loading, items: [], page: 1));
      } else {
        emit(state.copyWith(status: UserListStatus.loading));
      }

      final response = await repository.fetchUserList(state.page.toString(), state.perPage.toString());
      final newUsers = response.data.where((newUser) => !state.items.any((existingUser) => existingUser.id == newUser.id)).toList();

      final items = List.of(state.items)..addAll(newUsers);
      final isLastPage = state.page >= response.totalPages;
      final nextPage = state.page + 1;
      emit(state.copyWith(status: UserListStatus.success, items: items, message: Messages.dataFetchedSuccessfully, isLastPage: isLastPage, page: nextPage));
    } catch (e) {
      emit(state.copyWith(status: UserListStatus.failure, message: e.toString()));
    }
  }
}
