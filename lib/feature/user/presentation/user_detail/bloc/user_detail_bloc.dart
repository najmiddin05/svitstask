import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:svitstask/config/constants/strings.dart';
import 'package:svitstask/feature/user/domain/model/user_detail/user_detail.dart';
import 'package:svitstask/feature/user/domain/repository/user_list_repository.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

/// [UserDetailBloc] is a BLoC class that manages the state of the user detail page.
/// It handles events related to fetching user details and updates the state accordingly.
class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final UserListRepository repository;

  UserDetailBloc({required this.repository}) : super(const UserDetailState()) {
    on<FetchOneUserEvent>(_fetchOneUser);
  }

  /// Handles the [FetchOneUserEvent] to fetch the details of a specific user from the repository.
  /// Emits states for loading, success, and failure.
  void _fetchOneUser(FetchOneUserEvent event, Emitter<UserDetailState> emit) async {
    try {
      emit(state.copyWith(status: UserDetailStatus.loading));
      final response = await repository.fetchUser(event.id.toString());

      emit(
        state.copyWith(
          status: UserDetailStatus.success,
          message: Messages.dataFetchedSuccessfully,
          data: response,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UserDetailStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
