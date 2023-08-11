import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahfi_app/src/common/data/repositories/auth_repository.dart';
import 'package:kahfi_app/src/common/data/sources/remote/config/result.dart';
import 'package:kahfi_app/src/common/domain/entities/user.dart';
import 'package:kahfi_app/src/common/domain/enums/auth_status.dart';

class AuthService extends ChangeNotifier {
  AuthService(this.authRepository);

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
}

final authServiceProvider = ChangeNotifierProvider<AuthService>(
  (ref) => AuthService(ref.read(authRepositoryProvider)),
);
