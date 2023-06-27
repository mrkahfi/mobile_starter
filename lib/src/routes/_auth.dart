part of 'routes.dart';

final _authRoutes = ShellRoute(
  navigatorKey: _shellNavigatorKey,
  pageBuilder: (context, state, child) {
    log('location: ${state.location}');
    return NoTransitionPage(
      child: MainScreen(
        location: state.location,
        child: child,
      ),
    );
  },
  routes: [
    GoRoute(
      path: Routes.signin.path,
      name: Routes.signin.name,
      builder: (BuildContext context, GoRouterState state) =>
          const SignInScreen(),
    ),
    GoRoute(
      path: Routes.register.path,
      name: Routes.register.name,
      builder: (BuildContext context, GoRouterState state) =>
          const RegisterScreen(),
    )
  ],
);
