import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_uber/src/features/onboarding/onboarding_state.dart';

class OnboardingController extends StateNotifier<OnboardingState> {
  OnboardingController(this.ref) : super(const OnboardingState());
  final Ref ref;
}

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, OnboardingState>(
  OnboardingController.new,
);
