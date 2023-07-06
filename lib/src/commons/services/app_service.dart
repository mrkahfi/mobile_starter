// ignore: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/commons/data/datasource/local/hive_service.dart';

class AppService with ChangeNotifier {
  AppService(this.ref);

  final Ref ref;

  bool get initialized => ref.watch(hiveServiceProvider).initialized;
  bool get onboarded => ref.watch(hiveServiceProvider).onboarded;

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
