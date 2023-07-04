import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:zot_starter/src/app/themes/foundation/sizes.dart';
import 'package:zot_starter/src/commons/services/app_service.dart';
import 'package:zot_starter/src/commons/ui_components/button.dart';
import 'package:zot_starter/src/features/onboarding/widgets/onboarding_item.dart';
import 'package:zot_starter/src/routing/routes.dart';
import 'package:zot_starter/src/utils/extensions/build_context_extension/theme_colors.dart';

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
                    icon: const Icon(Icons.shopping_bag),
                  ),
                  WelcomePageItem(
                    title: items[1].title,
                    content: items[1].content,
                    icon: const Icon(Icons.shopping_bag),
                  ),
                  WelcomePageItem(
                    title: items[1].title,
                    content: items[1].content,
                    icon: const Icon(Icons.shopping_bag),
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
                    spacing: AppSizes.h16,
                    dotColor: context.onSecondary,
                    activeDotColor: context.secondary,
                  ),
                ),
                Gap.h20,
                if (_isLastPage)
                  CommonButton(
                    'Start',
                    onPressed: () {
                      ref.read(appServiceProvider).onboarded = true;
                      context.goNamed(Routes.login.name);
                    },
                  )
                else
                  Row(
                    children: [
                      CommonButton(
                        'Skip',
                        onPressed: () {
                          _controller.jumpToPage(2);
                        },
                      ),
                      const Spacer(),
                      CommonButton(
                        'Next',
                        onPressed: () {
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
    );
  }
}
