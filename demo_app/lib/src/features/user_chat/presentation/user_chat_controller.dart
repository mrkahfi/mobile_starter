

import 'package:demo_app/src/features/user_chat/application/user_chat_service.dart';
import 'package:demo_app/src/features/user_chat/presentation/user_chat_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class  UserChatController extends StateNotifier<UserChatState> {
  UserChatController(this.ref) : super(const UserChatState());
  final Ref ref;

  Future<void> getMessage() async {
    state = state.copyWith(message: const AsyncLoading());
    
    final result = await ref.read(userChatServiceProvider).message;

    result.when(
      success: (data) {
        state = state.copyWith(message: AsyncValue.data(data));
      },
      failure: (error, stackTrace) {
        state = state.copyWith(message: AsyncValue.error(error, stackTrace));
      },
    );
  }
}

final  userChatControllerProvider =
    StateNotifierProvider<UserChatController, UserChatState>(
      UserChatController.new,);
