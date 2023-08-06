import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:zot_starter/src/common/data/data.dart';
import 'package:zot_starter/src/common/data/sources/sources.dart';
import 'package:zot_starter/src/common/domain/entities/user.dart';

class SocialAuthRepository {
  SocialAuthRepository(
    this.authApi, {
    required this.hiveService,
    GoogleSignIn? googleSignin,
    FacebookAuth? facebookSignIn,
  })  : _googleSignIn = googleSignin ?? GoogleSignIn(),
        _facebookSignIn = facebookSignIn ?? FacebookAuth.instance;

  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookSignIn;

  final SocialAuthApi authApi;
  final HiveService hiveService;

  User? get currentUser => hiveService.currentUser;

  Future<String?> get userToken => hiveService.userToken;

  Future<OAuthCredential> get googleOAuthCredential async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return oAuthCredential;
    } catch (err) {
      rethrow;
    }
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<OAuthCredential> get appleOAuthCredential async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      return oauthCredential;
    } catch (err) {
      rethrow;
    }
  }

  Future<OAuthCredential> get facebookOAuthCredential async {
    final result =
        await _facebookSignIn.login(permissions: ['email', 'public_profile']);

    if (result.status == LoginStatus.cancelled ||
        result.status == LoginStatus.failed) {
      throw Exception('Auth failed or canceled by user');
    }

    final oAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return oAuthCredential;
  }

  Future<Result<User>> socialLogin(OAuthCredential credential) async {
    try {
      final response = await authApi.socialLogin(credential.asMap());

      final user = UserMapper.mapUserResponseToUser(response);

      hiveService.saveCurrentUser(user);
      await hiveService.saveUserToken(response.token);
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }
}

final socialAuthRepositoryProvider = Provider<SocialAuthRepository>(
  (ref) => SocialAuthRepository(
    ref.watch(socialAuthApiProvider),
    hiveService: ref.watch(hiveServiceProvider),
  ),
);
