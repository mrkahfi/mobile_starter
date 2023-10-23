output="../build/ios_integ"
product="build/ios_integ/Build/Products"
dev_target="16.4"

# Pass --simulator if building for the simulator.
flutter build ios integration_test/login_e2e_test.dart --flavor=dev --dart-define=ENV=DEV --dart-define=API_URL=https://zot-starter-dev.web.app/ --release

pushd ios
xcodebuild build-for-testing \
  -workspace Runner.xcworkspace \
  -scheme Runner \
  -xcconfig Flutter/Release.xcconfig \
  -configuration Release-dev \
  -derivedDataPath \
  $output -sdk iphoneos
popd

pushd $product
zip -r "ios_tests.zip" "Release-dev-iphoneos" "Runner_iphoneos$dev_target-arm64.xctestrun"
popd