

import 'package:demo_app/src/features/plant/application/plant_service.dart';
import 'package:demo_app/src/features/plant/presentation/plant_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class  PlantController extends StateNotifier<PlantState> {
  PlantController(this.ref) : super(const PlantState());
  final Ref ref;

  Future<void> getPlantItem() async {
    state = state.copyWith(plantItem: const AsyncLoading());
    
    final result = await ref.read(plantServiceProvider).plantItem;

    result.when(
      success: (data) {
        state = state.copyWith(plantItem: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(plantItem: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final  plantControllerProvider =
    StateNotifierProvider<PlantController, PlantState>(
      PlantController.new,);
