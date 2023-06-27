part of 'routes.dart';

ShellRoute _authRoutes(AuthService authService) => ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => child,
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
