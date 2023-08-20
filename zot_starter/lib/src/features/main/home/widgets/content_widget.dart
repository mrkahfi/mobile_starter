part of '../home_screen.dart';

class _ContentWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(homeControllerProvider).value;
    return AsyncValueWidget(
      value: items,
      data: (items) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = items[index];
            return ItemCard(item: item);
          },
          itemCount: items.length,
        ).withDefaultPadding;
      },
    );
  }
}
