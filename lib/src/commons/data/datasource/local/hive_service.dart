import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/commons/data/datasource/local/secure_storage_service.dart';
import 'package:zot_starter/src/commons/domain/entities/user.dart';

class HiveService {
  HiveService(this.secureStorageService);

  final SecureStorageService secureStorageService;

  final userBox = Hive.box<User>(HiveKey.userBox);
  final appInitializedBox = Hive.box<bool>(HiveKey.isInitializedBox);
  final appOnboardedBox = Hive.box<bool>(HiveKey.isOnboardedBox);
  final encryptedBox = Hive.box<String?>(HiveKey.encryptedBox);

  Future<void> close() async {
    await Hive.close();
  }

  set onboarded(bool isOnboarded) =>
      appOnboardedBox.put(HiveKey.isOnboarded, isOnboarded);

  bool get onboarded => appOnboardedBox.get(HiveKey.isOnboarded) ?? false;

  set initialized(bool isInitialized) =>
      appInitializedBox.put(HiveKey.isInitialized, isInitialized);

  bool get initialized => appInitializedBox.get(HiveKey.isInitialized) ?? false;

  /// Set Current User
  void saveCurrentUser(User user) => userBox.put(HiveKey.user, user);

  /// Get current User
  User? getCurrentUser() => userBox.get(HiveKey.user);

  /// Delete Current User
  void deleteCurrentUser() => userBox.delete(HiveKey.user);

  /// Set User Token
  Future<void> saveUserToken(String token) async =>
      encryptedBox.put(HiveKey.userToken, token);

  /// Get Current User
  Future<String?> getUserToken() async => encryptedBox.get(HiveKey.userToken);

  /// Delete Ccrrent User Token
  void deleteUserToken() => encryptedBox.delete(HiveKey.userToken);
}

final hiveServiceProvider = Provider<HiveService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider)..init();
  return HiveService(secureStorage);
});
