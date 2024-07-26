import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svitstask/config/constants/dimens.dart';
import 'package:svitstask/config/constants/strings.dart';
import 'package:svitstask/core/presentation/bloc/app_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_list/bloc/user_list_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_list/component/change_theme_button.dart';
import 'package:svitstask/feature/user/presentation/user_list/component/shimmer_item.dart';
import 'package:svitstask/feature/user/presentation/user_list/component/user_list_item.dart';
import 'package:svitstask/feature/user/presentation/user_list/page/user_list_mixin.dart';

/// The [UserListPage] is a stateful widget that displays a list of users.
/// It uses a [UserListBloc] to manage the state of the user list and handles
/// theme changes with an [AppBloc].

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> with UserListMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Dimens.elevation,
        title: const Text(Strings.userList),
        actions: [
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return ChangeThemeButton(themeMode: state.themeMode, onPressed: () => changeTheme(state.themeMode));
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            return ListView.builder(
              cacheExtent: Dimens.borderRadius100,
              itemCount: state.items.isEmpty ? null : (state.items.length + (state.isLastPage ? 0 : 1)),
              itemBuilder: (context, index) {
                if (index == state.items.length && state.status != UserListStatus.loading) {
                  context.read<UserListBloc>().add(const FetchAllUserListEvent());
                }
                if (state.items.isEmpty || index >= state.items.length) {
                  return const ShimmerItem();
                } else {
                  return UserListItem(
                    user: state.items[index],
                    onTap: () => goDetail(state.items[index].id),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
