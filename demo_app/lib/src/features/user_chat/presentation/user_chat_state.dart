import 'package:demo_app/src/features/user_chat/domain/entities/message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_chat_state.freezed.dart';

@freezed
class UserChatState with _$UserChatState {
  const factory UserChatState({
    @Default(AsyncValue.data(null)) AsyncValue<Message?> message,
  }) = _UserChatState;
}
