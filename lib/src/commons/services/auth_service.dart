import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/commons/data/datasource/remote/config/result.dart';
import 'package:zot_starter/src/commons/data/repositories/auth_repository.dart';
import 'package:zot_starter/src/commons/domain/entities/user.dart';
import 'package:zot_starter/src/commons/domain/enums/auth_status.dart';

class AuthService {
  AuthService(this.authRepository);

  final AuthRepository authRepository;

  Future<Result<User>> login(String email, String password) {
    return authRepository.login(email, password);
  }

  void logout() => authRepository.logout();

  Stream<User?> authStateChanges() => authRepository.authStateChanges();

  AuthStatus get authStatus => authRepository.currentUser != null
      ? AuthStatus.authenticated
      : AuthStatus.unauthenticated;
}

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref.read(authRepositoryProvider)),
);
