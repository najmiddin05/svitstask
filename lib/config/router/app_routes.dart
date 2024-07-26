import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:svitstask/config/router/name_routes.dart';
import 'package:svitstask/feature/user/presentation/user_detail/page/user_detail_page.dart';
import 'package:svitstask/feature/user/presentation/user_list/page/user_list_page.dart';

/// [rootNavigatorKey] is the root navigator key for the application.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

/// [AppRoute] defines the routes for the application using [GoRouter].
class AppRoute {
  const AppRoute();

  static String initialLocation = Routes.userList;

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    initialLocation: initialLocation,
    routes: <RouteBase>[
      /// User list route
      GoRoute(
        path: Routes.userList,
        name: Routes.userList,
        routes: <RouteBase>[
          /// User detail route
          GoRoute(
            path: Routes.userDetail,
            name: Routes.userDetail,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionDuration: const Duration(milliseconds: 700),
                transitionsBuilder: (_, animation1, animation2, child) => CupertinoPageTransition(
                  primaryRouteAnimation: animation1,
                  secondaryRouteAnimation: animation2,
                  linearTransition: false,
                  child: child,
                ),
                child: UserDetailPage(id: state.uri.queryParameters['id']),
              );
            },
          ),
        ],
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder: (_, animation1, animation2, child) => CupertinoPageTransition(
              primaryRouteAnimation: animation1,
              secondaryRouteAnimation: animation2,
              linearTransition: false,
              child: child,
            ),
            child: const UserListPage(),
          );
        },
      ),
    ],
  );
}
