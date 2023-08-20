import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zot_starter/src/common/data/repositories/auth_repository.dart';
import 'package:zot_starter/src/common/data/sources/remote/config/result.dart';
import 'package:zot_starter/src/common/domain/entities/user.dart';
import 'package:zot_starter/src/common/domain/enums/auth_status.dart';

part 'auth_service.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    @Default(AuthStatus.unauthenticated) AuthStatus status,
    User? user,
  }) = _AuthState;
}

class AuthService extends StateNotifier<AuthState> {
  AuthService({required this.authRepository}) : super(AuthState());

  final AuthRepository authRepository;

  Future<Result<User>> login(String email, String password) {
    final result = authRepository.login(email, password);
    return result;
  }

  Future<void> logout() async {
    await authRepository.logout();
  }

  Future<AuthStatus> get authStatus async {
    final userToken = await authRepository.userToken;
    return userToken != null
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }

  User? get currentUser => authRepository.currentUser;

  // end social auth
}

final authStateProvider = StateNotifierProvider<AuthService, AuthState>(
  (ref) => AuthService(authRepository: ref.read(authRepositoryProvider)),
);

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(authRepository: ref.read(authRepositoryProvider)),
);
