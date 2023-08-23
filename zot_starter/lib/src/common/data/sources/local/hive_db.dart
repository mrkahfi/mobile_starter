import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zot_starter/src/app/constants/constants.dart';
import 'package:zot_starter/src/app/constants/keys/storage_key.dart';
import 'package:zot_starter/src/common/domain/entities/user.dart';
import 'package:zot_starter/src/features/cart/domain/cart.dart';

class HiveDB {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(CartAdapter());
    // TODO: register more entity Adapters here

    await Hive.openBox<User>(HiveKey.userBox);
    await Hive.openBox<String?>(HiveKey.userTokenBox);
    await Hive.openBox<String>(HiveKey.passwordBox);
    await Hive.openBox<bool>(HiveKey.isOnboardedBox);
    await Hive.openBox<bool>(HiveKey.isInitializedBox);
    await Hive.openBox<String>(HiveKey.themeBox);
    await Hive.openBox<Cart>(HiveKey.cartBox);

    const storage = FlutterSecureStorage();
    final containsEncryptionKey = await storage.read(key: StorageKey.secureKey);

    if (containsEncryptionKey == null) {
      final encryptionKey = Hive.generateSecureKey();
      await storage.write(
        key: StorageKey.secureKey,
        value: base64UrlEncode(encryptionKey),
      );
    }

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