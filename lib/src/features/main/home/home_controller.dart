import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/commons/services/main_service.dart';
import 'package:zot_starter/src/features/main/home/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this.ref) : super(const HomeState());
  final Ref ref;

  Future<void> fetchItems() async {
    state = state.copyWith(value: const AsyncLoading());
    final response = await ref.read(mainServiceProvider).fetchItems();

    response.when(
      success: (data) {
        state = state.copyWith(value: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(value: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final homeController = HomeController(ref)..fetchItems();
  return homeController;
});
