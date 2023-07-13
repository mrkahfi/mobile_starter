import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:demo_app/src/app.dart';
import 'package:demo_app/src/app/config/config.dart';
import 'package:demo_app/src/app/constants/constants.dart';
import 'package:demo_app/src/commons/data/sources/local/hive_db.dart';
import 'package:demo_app/src/commons/data/sources/remote/config/http_overrides.dart';
import 'package:demo_app/src/localization/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

void main() {
  const env = String.fromEnvironment(
    AppConstants.env,
    defaultValue: AppConstants.envDev,
  );
  F.configureFromEnv(env);

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      await Firebase.initializeApp(
        name: AppConfig.firebaseAppName.value,
        options: AppConfig.firebaseOptions.value,
      );
      await HiveDB.init();

      // to skip the problem of SSL certification
      // and solve the Image.network(url) issue
      HttpOverrides.global = AppHttpOverrides();

      FlutterError.demangleStackTrace = (StackTrace stack) {
        if (stack is stack_trace.Trace) return stack.vmTrace;
        if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
        return stack;
      };

      runApp(
        ProviderScope(
          child: EasyLocalization(
            fallbackLocale: AppConstants.localeID,
            supportedLocales: const [
              AppConstants.localeID,
              AppConstants.localeEN
            ],
            path: AppConstants.translationsAssetPath,
            assetLoader: const CodegenLoader(),
            child: const MyApp(),
          ),
        ),
      );
    },
    (error, stackTrace) {
      // use log() instead of debugPrint() or print()
      log(error.toString(), error: error, stackTrace: stackTrace);
    },
  );
}
