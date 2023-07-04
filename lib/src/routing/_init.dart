part of 'routes.dart';

final initRoutesProvider = Provider(
  (ref) => ShellRoute(
    navigatorKey: _initNavigatorKey,
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
  ),
);
