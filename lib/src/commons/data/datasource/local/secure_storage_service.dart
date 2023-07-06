import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zot_starter/src/app/constants/keys/storage_key.dart';

class SecureStorageService {
  final _secureStorage = const FlutterSecureStorage();

  FlutterSecureStorage get storage => _secureStorage;

  Future<void> init() async {
    final containsEncryptionKey =
        await storage.containsKey(key: StorageKey.secureKey);

    if (!containsEncryptionKey) {
      final encryptionKey = Hive.generateSecureKey();
      await storage.write(
        key: StorageKey.secureKey,
        value: base64UrlEncode(encryptionKey),
      );
    }
  }

  Future<String?> readKey() async => storage.read(key: StorageKey.secureKey);
}

final secureStorageProvider = Provider((ref) => SecureStorageService());
