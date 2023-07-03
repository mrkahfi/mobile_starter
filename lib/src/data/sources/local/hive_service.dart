import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zot_starter/src/app/constants/constants.dart';

class HiveService {
  final hiveUser = Hive.box<String>(HiveKey.userBox);
  final hiveUserToken = Hive.box<String>(HiveKey.userTokenBox);
  final hiveEmail = Hive.box<String>(HiveKey.emailBox);
  final hivePassword = Hive.box<String>(HiveKey.passwordBox);

  final hiveInitialized = Hive.box<bool>(HiveKey.isInitializedBox);
  final hiveOnboarded = Hive.box<bool>(HiveKey.isOnboardedBox);

  set onboarded(bool isOnboarded) =>
      hiveOnboarded.put(HiveKey.isOnboarded, isOnboarded);

  bool get onboarded => hiveOnboarded.get(HiveKey.isOnboarded) ?? false;

  set initialized(bool isInitialized) =>
      hiveInitialized.put(HiveKey.isInitialized, isInitialized);

  bool get initialized => hiveInitialized.get(HiveKey.isInitialized) ?? false;

  /// Delete Current User
  void deleteCurrentUser() => hiveUser.delete(HiveKey.user);

  /// Get Current User
  String? getUserToken() => hiveUserToken.get(HiveKey.userToken);

  /// Set User Token
  void saveUserToken(String token) =>
      hiveUserToken.put(HiveKey.userToken, token);

  /// Delete User Token
  void deleteUserToken() => hiveUserToken.delete(HiveKey.userToken);

  /// Set User Credential
  void saveUserCredential({
    required String email,
    required String password,
  }) {
    hiveEmail.put(HiveKey.email, email);
    hivePassword.put(HiveKey.password, password);
  }

  /// Get Credential Email
  String? getCredentialEmail() => hiveEmail.get(HiveKey.email);

  /// Get Credential Password
  String? getCredentialPassword() => hivePassword.get(HiveKey.password);

  /// Set logout
  void logout() {
    deleteCurrentUser();
  }
}

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());
