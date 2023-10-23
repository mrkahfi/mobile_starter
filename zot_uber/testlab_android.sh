pushd android
# flutter build generates files in android/ for building the app
fvm flutter build apk
./gradlew app:assembleAndroidTest -Pdart-defines="RU5WPURFVg==,QVBJX1VSTD1odHRwczovL3pvdC1zdGFydGVyLWRldi53ZWIuYXBwLw=="  -Ptarget=`pwd`/../integration_test/login_e2e_test.dart
./gradlew app:assembleDev -Pdart-defines="RU5WPURFVg==,QVBJX1VSTD1odHRwczovL3pvdC1zdGFydGVyLWRldi53ZWIuYXBwLw=="  -Ptarget=`pwd`/../integration_test/login_e2e_test.dart
popd

gcloud auth activate-service-account --key-file=key.json
gcloud --quiet config set project zot-starter-dev
gcloud firebase test android run --type instrumentation \
  --app build/app/outputs/apk/dev/debug/app-dev-debug.apk \
  --test build/app/outputs/apk/androidTest/dev/debug/app-dev-debug-androidTest.apk\
  --timeout 2m \