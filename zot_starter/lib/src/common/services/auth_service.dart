import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/data/repositories/auth_repository.dart';
import 'package:zot_starter/src/common/data/sources/remote/config/result.dart';
import 'package:zot_starter/src/common/domain/entities/user.dart';
import 'package:zot_starter/src/common/domain/enums/auth_status.dart';

class AuthService extends ChangeNotifier {
  AuthService({required this.authRepository});

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

  // end social auth
}

final authServiceProvider = ChangeNotifierProvider<AuthService>(
  (ref) => AuthService(authRepository: ref.read(authRepositoryProvider)),
);
