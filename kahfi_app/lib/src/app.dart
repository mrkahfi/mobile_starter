import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kahfi_app/src/app/config/config.dart';
import 'package:kahfi_app/src/app/constants/constants.dart';
import 'package:kahfi_app/src/features/main/main_controller.dart';
import 'package:kahfi_app/src/routing/routes.dart';
import 'package:kahfi_app/src/utils/dynamic_link/dynamic_link_notifier.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routers = ref.watch(goRouterProvider);

    ref.listen<Uri?>(
      dynamicLinkNotifierProvider,
      (prevUri, currentUri) => handleDeepLink(ref, routers, currentUri),
    );

    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(
        AppConstants.kMobileScreenWidth,
        AppConstants.kMobileScreenHeight,
      ),
      builder: (context, child) {
        final themeMode = ref.watch(appControllerProvider).currentTheme;
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: routers.routeInformationParser,
          routerDelegate: routers.routerDelegate,
          routeInformationProvider: routers.routeInformationProvider,
          localizationsDelegates: context.localizationDelegates,
          title: AppConfig.appName.value,
          theme: AppTheme.light,
          builder: (context, child) {
            final isProdVariant = F.flavor == Flavor.prod;
            return _FlavorBanner(
              show: !isProdVariant,
              child: child,
            );
          },
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
        );
      },
    );
  }
}

class _FlavorBanner extends StatelessWidget {
  const _FlavorBanner({
    required this.show,
    this.child,
  });

  final Widget? child;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return show
        ? Banner(
            location: BannerLocation.topEnd,
            message: AppConfig.appBannerName.value,
            color: LightColors.errorColor,
            child: child,
          )
        : Container(child: child);
  }
}
