part of 'routes.dart';

void handleDeepLink(
  WidgetRef ref,
  GoRouter goRouter,
  Uri? newUri,
) {
  // verify uri and token exist
  if (newUri == null) return;

  goRouter.push(
    newUri.path,
    extra: newUri.queryParameters,
  );
  ref.read(dynamicLinkNotifierProvider.notifier).clear();
}
