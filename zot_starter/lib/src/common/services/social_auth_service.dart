import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:zot_starter/src/common/data/repositories/social_auth_repository.dart';
import 'package:zot_starter/src/common/data/sources/remote/config/result.dart';
import 'package:zot_starter/src/common/domain/entities/user.dart';

class SocialAuthService extends ChangeNotifier {
  SocialAuthService({
    required this.socialAuthRepository, // social auth
  });

  final SocialAuthRepository socialAuthRepository; // social auth

  // social auth
  Future<Result<User>> loginWithGoogle() async {
    final credential = await socialAuthRepository.googleOAuthCredential;
    return socialAuthRepository.socialLogin(credential);
  }

  Future<Result<User>> loginWithFacebook() async {
    final credential = await socialAuthRepository.facebookOAuthCredential;
    return socialAuthRepository.socialLogin(credential);
  }

  Future<Result<User>> loginWithApple() async {
    final credential = await socialAuthRepository.appleOAuthCredential;
    return socialAuthRepository.socialLogin(credential);
  }
}

final socialAuthServiceProvider = ChangeNotifierProvider<SocialAuthService>(
  (ref) => SocialAuthService(
    socialAuthRepository: ref.read(socialAuthRepositoryProvider),
  ),
);
