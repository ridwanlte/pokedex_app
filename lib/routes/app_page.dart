import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/features/home/presentations/pages/home_page.dart';
import 'package:pokedex_app/features/home/presentations/pages/menu_page.dart';

part 'app_route.dart';

class AppPage {
  AppPage._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: _Paths.MENU,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        name: _Paths.MENU,
        path: _Paths.MENU,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: MenuPage());
        },
      ),
    ],
    // errorPageBuilder: (context, state) {
    //   return CustomTransitionPage(
    //     key: state.pageKey,
    //     child: const PageNotFoundView(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       return FadeTransition(
    //         opacity: animation,
    //         child: child,
    //       );
    //     },
    //   );
    // },
  );
}
