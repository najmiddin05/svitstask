import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_detail/bloc/user_detail_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_detail/page/user_detail_page.dart';

/// [UserDetailMixin] is a mixin for the [UserDetailPage] state,
/// providing utility methods to handle the initial data fetching.
mixin UserDetailMixin on State<UserDetailPage> {
  @override
  void initState() {
    super.initState();
    // Fetch user details when the state initializes
    context.read<UserDetailBloc>().add(FetchOneUserEvent(id: int.tryParse(widget.id!)!));
  }
}
