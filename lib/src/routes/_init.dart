part of 'routes.dart';

final _initRoutes = ShellRoute(
  navigatorKey: _shellNavigatorKey,
  builder: (context, state, child) => child,
  routes: [
    GoRoute(
      path: Routes.onboarding.path,
      name: Routes.onboarding.name,
      builder: (BuildContext context, GoRouterState state) =>
          const OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.splash.path,
      name: Routes.splash.name,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    )
  ],
);
