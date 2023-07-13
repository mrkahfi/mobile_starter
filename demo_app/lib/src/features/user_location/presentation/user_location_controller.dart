

import 'package:demo_app/src/features/user_location/application/user_location_service.dart';
import 'package:demo_app/src/features/user_location/presentation/user_location_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class  UserLocationController extends StateNotifier<UserLocationState> {
  UserLocationController(this.ref) : super(const UserLocationState());
  final Ref ref;

  Future<void> getLocationItem() async {
    state = state.copyWith(locationItem: const AsyncLoading());
    
    final result = await ref.read(userLocationServiceProvider).locationItem;

    result.when(
      success: (data) {
        state = state.copyWith(locationItem: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(locationItem: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final  userLocationControllerProvider =
    StateNotifierProvider<UserLocationController, UserLocationState>(
      UserLocationController.new,);
