import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zot_starter/src/commons/domain/enums/auth_status.dart';
import 'package:zot_starter/src/commons/services/app_service.dart';
import 'package:zot_starter/src/commons/services/auth_service.dart';
import 'package:zot_starter/src/features/auth/login/login_screen.dart';
import 'package:zot_starter/src/features/auth/register/register_screen.dart';
import 'package:zot_starter/src/features/main/home/home_screen.dart';
import 'package:zot_starter/src/features/main/main_screen.dart';
import 'package:zot_starter/src/features/onboarding/onboarding_screen.dart';
import 'package:zot_starter/src/features/splash/splash_screen.dart';
import 'package:zot_starter/src/utils/dynamic_link/dynamic_link_notifier.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

export 'package:go_router/go_router.dart';

part '_deeplink_handler.dart';
part '_route_enums.dart';
// It is better to split the route into smal chunks based on their focused area
// or based on feature modules
part 'routes/_auth.dart';
part 'routes/_init.dart';
part 'routes/_main.dart';

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
