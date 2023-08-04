import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/data/repositories/auth_repository.dart';
import 'package:zot_starter/src/common/data/repositories/social_auth_repository.dart';
import 'package:zot_starter/src/common/data/sources/remote/config/result.dart';
import 'package:zot_starter/src/common/domain/entities/user.dart';
import 'package:zot_starter/src/common/domain/enums/auth_status.dart';

class AuthService extends ChangeNotifier {
  AuthService({
    required this.authRepository,
    required this.socialAuthRepository, // social auth
  });

  final AuthRepository authRepository;
  final SocialAuthRepository socialAuthRepository; // social auth

  Future<Result<User>> login(String email, String password) {
    final result = authRepository.login(email, password);
    return result;
  }

  Future<void> logout() async {
    await authRepository.logout();
  }

  Future<AuthStatus> get authStatus async {
    final userToken = await authRepository.userToken;
    return userToken != null
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }

  // social auth
  Future<Result<User>> loginWithGoogle() async {
    final credential = await socialAuthRepository.googleOAuthCredential;
    return authRepository.socialLogin(credential);
  }

  Future<Result<User>> loginWithFacebook() async {
    final credential = await socialAuthRepository.facebookOAuthCredential;
    return authRepository.socialLogin(credential);
  }

  Future<Result<User>> loginWithApple() async {
    final credential = await socialAuthRepository.appleOAuthCredential;
    return authRepository.socialLogin(credential);
  }
  // end social auth
}

final authServiceProvider = ChangeNotifierProvider<AuthService>(
  (ref) => AuthService(
    authRepository: ref.read(authRepositoryProvider),
    socialAuthRepository: ref.read(socialAuthRepositoryProvider),
  ),
);
