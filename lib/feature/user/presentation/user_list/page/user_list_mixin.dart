import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:svitstask/config/router/name_routes.dart';
import 'package:svitstask/core/presentation/bloc/app_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_list/bloc/user_list_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_list/page/user_list_page.dart';

/// [UserListMixin] is a mixin for the [UserListPage] state, providing
/// utility methods to handle initial data fetching, theme changing,
/// list refreshing, and navigation to user detail pages.
mixin UserListMixin on State<UserListPage> {

  @override
  void initState() {
    super.initState();
    _fetchInitialData(); // Fetch initial data when the state initializes
  }

  /// Fetches the initial data for the user list by triggering
  /// the [FetchAllUserListEvent] in the [UserListBloc].
  void _fetchInitialData() {
    context.read<UserListBloc>().add(const FetchAllUserListEvent());
  }

  /// Changes the theme of the app based on the current theme.
  /// Switches to dark mode if not already in dark mode, and vice versa.
  void changeTheme(ThemeMode? currentTheme) {
    if (currentTheme != ThemeMode.dark) {
      context.read<AppBloc>().add(const ChangeAppThemeEvent(themeMode: ThemeMode.dark));
    } else {
      context.read<AppBloc>().add(const ChangeAppThemeEvent(themeMode: ThemeMode.light));
    }
  }

  /// Refreshes the user list by triggering a refresh event
  /// in the [UserListBloc].
  Future<void> refresh() async {
    context.read<UserListBloc>().add(const FetchAllUserListEvent(refresh: true));
  }

  /// Navigates to the user detail page for the specified user ID.
  /// Uses [GoRouter] to push the named route [Routes.userDetail].
  void goDetail(int id) {
    context.pushNamed(Routes.userDetail, queryParameters: {'id': id.toString()});
  }
}
