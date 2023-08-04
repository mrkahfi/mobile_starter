import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialAuthRepository {
  SocialAuthRepository({
    GoogleSignIn? googleSignin,
    FacebookAuth? facebookSignIn,
  })  : _googleSignIn = googleSignin ?? GoogleSignIn(),
        _facebookSignIn = facebookSignIn ?? FacebookAuth.instance;

  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookSignIn;

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
}

final socialAuthRepositoryProvider =
    Provider<SocialAuthRepository>((ref) => SocialAuthRepository());
