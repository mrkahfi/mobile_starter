import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_components/common_widgets/button/button_widget.dart';
import 'package:ui_components/common_widgets/padding/padding_widget.dart';
import 'package:ui_components/gen/assets.gen.dart';
import 'package:ui_components/themes/app_color_constant.dart';
import 'package:ui_components/themes/app_size_constant.dart';
import 'package:ui_components/utils/theme_extension.dart';
import 'package:zot_starter/src/presentation/features/onboarding/widgets/onboarding_item.dart';
import 'package:zot_starter/src/routes/routes.dart';
import 'package:zot_starter/src/services/app_service.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  static const String _key = 'onboarding_screen';
  static const widgetKey = Key(_key);

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  bool _isLastPage = false;

  List<({String title, String content})> items = [
    (
      title: 'Page 1',
      content: '1. Lorem ipsum dolor sit amet, consectetur '
          'adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
    ),
    (
      title: 'Page 2',
      content: '2. Lorem ipsum dolor sit amet, consectetur '
          'adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
    ),
    (
      title: 'Page 3',
      content: '3. Lorem ipsum dolor sit amet, consectetur '
          'adipiscing elit, sed do eiusmod tempor incididunt '
          'ut labore et dolore magna aliqua.'
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: OnboardingScreen.widgetKey,
      backgroundColor: context.theme.colorScheme.primary,
      body: SafeArea(
        child: PaddingWidget(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _isLastPage = index == 2;
                    });
                  },
                  children: [
                    WelcomePageItem(
                      title: items[0].title,
                      content: items[0].content,
                      icon: Assets.icons.sneakerMIcon.svg(
                        width: MediaQuery.of(context).size.height * 0.3,
                        height: MediaQuery.of(context).size.height * 0.3,
                        theme: const SvgTheme(currentColor: ColorApp.white),
                        package: 'ui_components',
                      ),
                    ),
                    WelcomePageItem(
                      title: items[1].title,
                      content: items[1].content,
                      icon: Assets.icons.sneakerMIcon.svg(
                        width: MediaQuery.of(context).size.height * 0.3,
                        height: MediaQuery.of(context).size.height * 0.3,
                        theme: const SvgTheme(currentColor: ColorApp.white),
                        package: 'ui_components',
                      ),
                    ),
                    WelcomePageItem(
                      title: items[1].title,
                      content: items[1].content,
                      icon: Assets.icons.sneakerMIcon.svg(
                        width: MediaQuery.of(context).size.height * 0.3,
                        height: MediaQuery.of(context).size.height * 0.3,
                        theme: const SvgTheme(currentColor: ColorApp.white),
                        package: 'ui_components',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(
                    count: 3,
                    controller: _controller,
                    effect: WormEffect(
                      spacing: SizeApp.h16,
                      dotColor: ColorApp.greyMedium2,
                      activeDotColor: ColorApp.white,
                    ),
                  ),
                  Gap.h20,
                  if (_isLastPage)
                    ButtonWidget.secondary(
                      text: 'Start',
                      onTap: () {
                        ref.read(appServiceProvider).onboarded = true;
                        context.goNamed(Routes.signin.name);
                      },
                    )
                  else
                    Row(
                      children: [
                        ButtonWidget.primary(
                          text: 'Skip',
                          isShrink: true,
                          isOutlined: true,
                          isSmallSize: true,
                          isEnabled: true,
                          onTap: () {
                            _controller.jumpToPage(2);
                          },
                        ),
                        const Spacer(),
                        ButtonWidget.secondary(
                          isShrink: true,
                          text: 'Next',
                          isSmallSize: true,
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ],
                    )
                ],
              ),
              Gap.h20,
            ],
          ),
        ),
      ),
    );
  }
}
