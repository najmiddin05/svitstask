import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svitstask/config/constants/strings.dart';
import 'package:svitstask/config/constants/text_styles.dart';
import 'package:svitstask/feature/user/presentation/user_detail/bloc/user_detail_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_detail/component/main_content.dart';
import 'package:svitstask/feature/user/presentation/user_detail/component/shimmer_content.dart';
import 'package:svitstask/feature/user/presentation/user_detail/page/user_detail_mixin.dart';

/// [UserDetailPage] is a stateful widget that displays the details of a user.
/// It uses a [UserDetailBloc] to manage the state of the user details.
class UserDetailPage extends StatefulWidget {
  final String? id;
  const UserDetailPage({super.key, required this.id});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> with UserDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar title updates based on the user details state
        title: BlocBuilder<UserDetailBloc, UserDetailState>(
          builder: (context, state) {
            return Text(
              "${state.data?.data.firstName ?? Strings.loading} ${state.data?.data.lastName ?? ''}",
              style: TextStyles.textStyles.plusJakartaSansSemiBold18.copyWith(color: Theme.of(context).cardColor),
            );
          },
        ),
      ),
      body: Builder(
        builder: (context) {
          return BlocBuilder<UserDetailBloc, UserDetailState>(
            builder: (context, state) {
              if (state.status == UserDetailStatus.loading) {
                // Show shimmer effect while loading
                return ShimmerContent(context: context);
              } else if (state.status == UserDetailStatus.success) {
                // Show main content when data is successfully loaded
                return MainContent(context: context, user: state.data!.data);
              } else {
                // Show error message on failure
                return const Center(child: Text(Strings.error));
              }
            },
          );
        },
      ),
    );
  }
}
