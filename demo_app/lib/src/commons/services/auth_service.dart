import 'package:demo_app/src/commons/data/repositories/auth_repository.dart';
import 'package:demo_app/src/commons/data/sources/remote/config/result.dart';
import 'package:demo_app/src/commons/domain/entities/user.dart';
import 'package:demo_app/src/commons/domain/enums/auth_status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
