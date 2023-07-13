

import 'package:demo_app/src/features/ikan/application/ikan_service.dart';
import 'package:demo_app/src/features/ikan/presentation/ikan_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class  IkanController extends StateNotifier<IkanState> {
  IkanController(this.ref) : super(const IkanState());
  final Ref ref;

  Future<void> getKakap() async {
    state = state.copyWith(kakap: const AsyncLoading());
    
    final result = await ref.read(ikanServiceProvider).kakap;

    result.when(
      success: (data) {
        state = state.copyWith(kakap: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(kakap: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final  ikanControllerProvider =
    StateNotifierProvider<IkanController, IkanState>(
      IkanController.new,);
