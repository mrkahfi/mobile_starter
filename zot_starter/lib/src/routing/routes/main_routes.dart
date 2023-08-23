part of '../routes.dart';

final Provider<ShellRoute> _mainRouteProvider = Provider<ShellRoute>((ref) {
  final authService = ref.watch(authServiceProvider);
  return ShellRoute(
    navigatorKey: _mainTabNavigatorKey,
    pageBuilder: (context, state, child) {
      return NoTransitionPage(
        child: MainScreen(
          location: state.location,
          child: child,
        ),
      );
    },
    routes: [
      GoRoute(
        path: MainTabRoute.tab1.path,
        parentNavigatorKey: _mainTabNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage(child: HomeScreen()),
      ),
      GoRoute(
        path: MainTabRoute.tab2.path,
        builder: (context, state) => const LoginScreen(),
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage(child: ProductListScreen()),
        routes: [
          GoRoute(
            path: '${Routes.productDetail.subPath}/:id',
            name: Routes.productDetail.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              final productId = state.params['id']!;
              return MaterialPage(
                child: ProductScreen(productId: productId),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: MainTabRoute.tab3.path,
        parentNavigatorKey: _mainTabNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const NoTransitionPage(child: ShoppingCartScreen()),
      ),
      GoRoute(
        path: MainTabRoute.tab4.path,
        parentNavigatorKey: _mainTabNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(
          child: ContentScreen(title: MainTabRoute.tab4.label),
        ),
      ),
      GoRoute(
        path: MainTabRoute.tab5.path,
        parentNavigatorKey: _mainTabNavigatorKey,
        redirect: (context, state) async {
          // TODO: make redirection popable
          final status = await authService.authStatus;
          return status == AuthStatus.unauthenticated
              ? Routes.login.path
              : null;
        },
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(
          child: ContentScreen(
            title: MainTabRoute.tab5.label,
            content: const LogoutButton(),
          ),
        ),
      ),
    ],
  );
});
