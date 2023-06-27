import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zot_starter/src/features/auth/application/auth_service.dart';
import 'package:zot_starter/src/features/auth/presentation/sign_in/register_screen.dart';
import 'package:zot_starter/src/features/auth/presentation/sign_out/widget/sign_out_button.dart';
import 'package:zot_starter/src/features/main/presentation/home/home_screen.dart';
import 'package:zot_starter/src/features/presentations.dart';
import 'package:zot_starter/src/utils/dynamic_link/dynamic_link_notifier.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

// It is better to split the route into smal chunks based on their focused area
// or based on feature modules
part '_auth.dart';
part '_deeplink_handler.dart';
part '_go_router_refresh_stream.dart';
part '_main.dart';
part '_route_enums.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  final authService = ref.watch(authServiceProvider);

  return GoRouter(
    initialLocation: Routes.signin.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = authService.isLoggedIn;

      if (isLoggedIn) {
        return Routes.main.path;
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authService.authStateChanges()),
    routes: [
      _authRoutes(authService),
      _mainRoutes(authService),
    ],
  );
});
