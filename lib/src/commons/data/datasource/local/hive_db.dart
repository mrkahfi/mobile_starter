import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/app/constants/keys/storage_key.dart';
import 'package:zot_starter/src/commons/domain/entities/user.dart';

class HiveDB {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserAdapter());

    await Hive.openBox<User>(HiveKey.userBox);
    await Hive.openBox<String?>(HiveKey.userTokenBox);
    await Hive.openBox<String>(HiveKey.passwordBox);
    await Hive.openBox<bool>(HiveKey.isOnboardedBox);
    await Hive.openBox<bool>(HiveKey.isInitializedBox);

    const storage = FlutterSecureStorage();

    final key = await storage.read(key: StorageKey.secureKey) ?? '';
    final encryptionKey = base64Url.decode(key);
    await Hive.openBox<String?>(
      HiveKey.encryptedBox,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  Future<void> close() async {
    await Hive.close();
  }
}
