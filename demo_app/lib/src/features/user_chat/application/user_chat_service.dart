import 'package:demo_app/src/commons/data/sources/remote/config/result.dart';
import 'package:demo_app/src/features/user_chat/domain/entities/message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserChatService {
  const UserChatService();
  // final UserChatRepository userChatRepository;

  Future<Result<Message>> get message async {
    // TODO(yourgitusername): connect to repositories or do something else
    // final message> = await userChatRepository.doSomething();
    return const Result.success(Message());
  }
}

final userChatServiceProvider = Provider<UserChatService>(
  (ref) => const UserChatService(),
);
