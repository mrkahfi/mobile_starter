import 'package:demo_app/src/app/config/config.dart';
import 'package:demo_app/src/app/constants/constants.dart';
import 'package:demo_app/src/app/themes/app_theme.dart';
import 'package:demo_app/src/commons/services/app_service.dart';
import 'package:demo_app/src/features/main/main_controller.dart';
import 'package:demo_app/src/routing/routes.dart';
import 'package:demo_app/src/utils/dynamic_link/dynamic_link_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zog_ui/zog_ui.dart';

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
      splitScreenMode: true,
      designSize: const Size(
        AppConstants.kMobileScreenWidth,
        AppConstants.kMobileScreenHeight,
      ),
      builder: (context, child) {
        return ZeroApp.router(
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
          themeMode: ref.watch(appServiceProvider).themeMode,
          color:
              ref.watch(mainControllerProvider).currentTheme == ThemeMode.light
                  ? LightColors.primaryColor
                  : DarkColors.primaryColor,
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
            color: LightColors.neutralColor[10],
            child: child,
          )
        : Container(child: child);
  }
}
