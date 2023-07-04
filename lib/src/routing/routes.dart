import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zot_starter/src/domain/enums/auth_status.dart';
import 'package:zot_starter/src/features/auth/login/login_screen.dart';
import 'package:zot_starter/src/features/auth/register/register_screen.dart';
import 'package:zot_starter/src/features/main/home/home_screen.dart';
import 'package:zot_starter/src/features/main/main_screen.dart';
import 'package:zot_starter/src/features/onboarding/onboarding_screen.dart';
import 'package:zot_starter/src/features/splash/splash_screen.dart';
import 'package:zot_starter/src/services/app_service.dart';
import 'package:zot_starter/src/services/auth_service.dart';
import 'package:zot_starter/src/utils/dynamic_link/dynamic_link_notifier.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

export 'package:go_router/go_router.dart';

// It is better to split the route into smal chunks based on their focused area
// or based on feature modules
part '_auth.dart';
part '_deeplink_handler.dart';
part '_init.dart';
part '_main.dart';
part '_route_enums.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _initNavigatorKey = GlobalKey<NavigatorState>();
final _mainTabNavigatorKey = GlobalKey<NavigatorState>();
final _authNavigatorKey = GlobalKey<NavigatorState>();

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  final appService = ref.watch(appServiceProvider);

  return GoRouter(
    initialLocation: Routes.splash.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      final initialized = appService.initialized;
      final onboarded = appService.onboarded;

      final goingToInit = state.subloc == Routes.splash.path;
      final goingToOnboard = state.subloc == Routes.onboarding.path;

      if (!initialized && !goingToInit) {
        return Routes.splash.path;
      }

      if (initialized && !onboarded && !goingToOnboard) {
        return Routes.onboarding.path;
      }

      return null;
    },
    refreshListenable: appService,
    routes: [
      ref.watch(initRoutesProvider),
      ref.watch(authRoutesProvider),
      ref.watch(_mainRouteProvider),
    ],
  );
});