import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svitstask/config/constants/colors.dart';
import 'package:svitstask/config/di/setup_locator.dart';
import 'package:svitstask/config/router/app_routes.dart';
import 'package:svitstask/config/constants/strings.dart';
import 'package:svitstask/core/presentation/bloc/app_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_detail/bloc/user_detail_bloc.dart';
import 'package:svitstask/feature/user/presentation/user_list/bloc/user_list_bloc.dart';

/// [MyApp] is the main application widget.
/// It sets up multiple [BlocProvider]s for dependency injection and configures the app theme and routing.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserListBloc>(create: (context) => locator<UserListBloc>()),
        BlocProvider<UserDetailBloc>(create: (context) => locator<UserDetailBloc>()),
        BlocProvider<AppBloc>(create: (context) => locator<AppBloc>()),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: Strings.svits,
            routerConfig: AppRoute.router,
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: ThemeData.light(useMaterial3: true).copyWith(
              scaffoldBackgroundColor: AppColors.white,
              appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
              cardColor: AppColors.grey,
              primaryColor: AppColors.green,
              hintColor: AppColors.greyShimmerLight,
            ),
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
              scaffoldBackgroundColor: AppColors.black,
              appBarTheme: const AppBarTheme(backgroundColor: AppColors.black),
              cardColor: AppColors.white,
              primaryColor: AppColors.steamGreen,
              hintColor: AppColors.greyShimmerDark,
            ),
          );
        },
      ),
    );
  }
}
