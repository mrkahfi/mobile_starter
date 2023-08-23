import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahfi_app/src/common/services/social_auth_service.dart';

import 'package:kahfi_app/src/features/auth/social_auth/social_auth_state.dart';

class SocialAuthController extends StateNotifier<SocialAuthState> {
  SocialAuthController(this.authService) : super(SocialAuthState());

  final SocialAuthService authService;

  Future<void> signInWithGoogle() async {
    final result = await authService.loginWithGoogle();

    result.when(
      success: (data) => null,
      failure: (error, stackTrace) => null,
    );
  }

  Future<void> signInWithFacebook() async {
    final result = await authService.loginWithFacebook();

    result.when(
      success: (data) => null,
      failure: (error, stackTrace) => null,
    );
  }

  Future<void> signInWithApple() async {
    final result = await authService.loginWithApple();

    result.when(
      success: (data) => null,
      failure: (error, stackTrace) => null,
    );
  }
}

final socialAuthController = StateNotifierProvider(
  (ref) => SocialAuthController(ref.watch(authServiceProvider)),
);
