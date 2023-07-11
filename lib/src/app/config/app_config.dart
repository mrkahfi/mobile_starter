import 'package:firebase_core/firebase_core.dart';
import 'package:app_baru/src/app/config/flavor_config.dart';
import 'package:app_baru/src/app/firebase/firebase_options.dart';
import 'package:app_baru/src/app/firebase/firebase_options_dev.dart'
    as dev;
import 'package:app_baru/src/app/firebase/firebase_options_stg.dart'
    as stg;

/// A config that serves as a source of configuration
/// regarding this app in general.
///
/// Such as appName, version, etc related to the application.
/// And here you can also use FlavorConfig to create different values
/// for each environment.
///
///
/// Example:
///
/// ```dart
/// static const appName = FlavorConfig<String>(
///    dev: 'App Dev',
///    prod: 'App',
///  );
///
/// static const versionCode = '1.0.0';
/// ```
///
/// And to check the configuration in the other code like this:
///
/// ```dart
/// Text(AppConfig.emailCS.value) // when use flavor add (.value) is the end
/// Text(AppConfig.versionCode) // when not use flavor
///
/// ```
class AppConfig {
  const AppConfig._();

  /// App baru
  static const appName = FlavorConfig<String>(
    dev: '[DEV] App baru',
    stg: '[STG] App baru',
    prod: 'App baru',
  );

  /// App baru for Firebase Options
  static const firebaseAppName = FlavorConfig<String>(
    dev: 'Devapp_baru',
    stg: 'Stgapp_baru',
    prod: 'app_baru',
  );

  /// App Banner Name
  static const appBannerName = FlavorConfig<String>(
    dev: '[DEV]',
    stg: '[STG]',
    prod: '',
  );

  /// FirebaeOptions
  static final firebaseOptions = FlavorConfig<FirebaseOptions>(
    dev: dev.DefaultFirebaseOptions.currentPlatform,
    stg: stg.DefaultFirebaseOptions.currentPlatform,
    prod: DefaultFirebaseOptions.currentPlatform,
  );
}
