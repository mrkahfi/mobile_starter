// ignore: non_constant_identifier_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/commons/data/datasource/local/hive_service.dart';
import 'package:zot_starter/src/commons/domain/enums/auth_status.dart';

class AppService with ChangeNotifier {
  AppService(this.ref);

  final Ref ref;
  final StreamController<bool> _authStateChange =
      StreamController<bool>.broadcast();
  final AuthStatus _authStatus = AuthStatus.unauthenticated;

  AuthStatus get authStatus => _authStatus;
  bool get initialized => ref.watch(hiveServiceProvider).initialized;
  bool get onboarded => ref.watch(hiveServiceProvider).onboarded;
  Stream<bool> get authStateChange => _authStateChange.stream;

  set initialized(bool value) {
    ref.watch(hiveServiceProvider).initialized = value;
    notifyListeners();
  }

  set onboarded(bool value) {
    ref.watch(hiveServiceProvider).onboarded = value;
    notifyListeners();
  }
}

final appServiceProvider = Provider(AppService.new);
