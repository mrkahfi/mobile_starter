import 'package:demo_app/src/app/config/flavor_config.dart';
import 'package:demo_app/src/app/firebase/firebase_options.dart';
import 'package:demo_app/src/app/firebase/firebase_options_dev.dart'
    as dev;
import 'package:demo_app/src/app/firebase/firebase_options_stg.dart'
    as stg;
import 'package:firebase_core/firebase_core.dart';

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

  /// Demo App
  static const appName = FlavorConfig<String>(
    dev: '[DEV] Demo App ',
    stg: '[STG] Demo App ',
    prod: 'Demo App ',
  );

  /// Demo App  for Firebase Options
  static const firebaseAppName = FlavorConfig<String>(
    dev: 'Devdemo_app',
    stg: 'Stgdemo_app',
    prod: 'demo_app',
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
