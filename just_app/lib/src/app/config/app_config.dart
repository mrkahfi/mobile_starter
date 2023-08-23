import 'package:firebase_core/firebase_core.dart';
import 'package:just_app/src/app/config/flavor_config.dart';
import 'package:just_app/src/app/firebase/firebase_options.dart';
import 'package:just_app/src/app/firebase/firebase_options_dev.dart'
    as dev;
import 'package:just_app/src/app/firebase/firebase_options_stg.dart'
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
class AppConfig {
  const AppConfig._();

  /// Just App
  static const appName = FlavorConfig<String>(
    dev: '[DEV] Just App ',
    stg: '[STG] Just App ',
    prod: 'Just App ',
  );

  /// Just App  for Firebase Options
  static const firebaseAppName = FlavorConfig<String>(
    dev: 'Dev_just_app',
    stg: 'Stg_just_app',
    prod: 'just_app',
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
