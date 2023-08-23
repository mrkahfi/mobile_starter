import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zot_starter/src/common/domain/enums/auth_status.dart';
import 'package:zot_starter/src/common/services/app_service.dart';
import 'package:zot_starter/src/common/services/auth_service.dart';
import 'package:zot_starter/src/features/auth/login/login_screen.dart';
import 'package:zot_starter/src/features/auth/logout/logout_button.dart';
import 'package:zot_starter/src/features/auth/register/register_screen.dart';
import 'package:zot_starter/src/features/cart/presentation/shopping_cart/shopping_cart_screen.dart';
import 'package:zot_starter/src/features/main/home/home_screen.dart';
import 'package:zot_starter/src/features/main/main_screen.dart';
import 'package:zot_starter/src/features/onboarding/onboarding_screen.dart';
import 'package:zot_starter/src/features/products/presentation/products_list/product_list_screen.dart';
import 'package:zot_starter/src/features/products/presentation/products_list/product_screen.dart';
import 'package:zot_starter/src/features/splash/splash_screen.dart';
import 'package:zot_starter/src/logging/analytics.dart';
import 'package:zot_starter/src/utils/dynamic_link/dynamic_link_notifier.dart';
import 'package:zot_starter/src/utils/extensions/string_extension.dart';

export 'package:go_router/go_router.dart';

part 'deeplink_handler.dart';
part 'route_enums.dart';
// It is better to split the route into smal chunks based on their focused area
// or based on feature modules
part 'routes/auth_routes.dart';
part 'routes/launch_routes.dart';
part 'routes/main_routes.dart';
part 'routes/product_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _initNavigatorKey = GlobalKey<NavigatorState>();
final _mainTabNavigatorKey = GlobalKey<NavigatorState>();
final _authNavigatorKey = GlobalKey<NavigatorState>();

final Provider<GoRouter> goRouterProvider = Provider<GoRouter>((ref) {
  final appService = ref.watch(appServiceProvider);
  final authService = ref.watch(authServiceProvider);

  return GoRouter(
    initialLocation: Routes.main.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) async {
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
    refreshListenable: authService,
    observers: [AnalyticsService.instance],
    routes: [
      ref.watch(_launchRoutesProvider),
      ref.watch(_authRoutesProvider),
      ref.watch(_mainRouteProvider),
      GoRoute(
        path: Routes.main.path,
        parentNavigatorKey: _rootNavigatorKey,
        name: Routes.main.name,
        redirect: (context, state) => MainTabRoute.tab1.path,
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.products.path,
        name: Routes.products.name,
        builder: (BuildContext context, GoRouterState state) =>
            const ProductListScreen(),
      ),
    ],
  );
});
