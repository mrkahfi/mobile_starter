import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/data/repositories/auth_repository.dart';
import 'package:zot_starter/src/domain/entities/user.dart';
import 'package:zot_starter/src/domain/enums/auth_status.dart';

class AuthService {
  AuthService(this.authRepository);

  final AuthRepository authRepository;

  void signIn(String email, String password) {
    authRepository.signInWithEmailAndPassword(email, password);
  }

  void signOut() => authRepository.signOut();

  Stream<User?> authStateChanges() => authRepository.authStateChanges();

  AuthStatus get authStatus => authRepository.currentUser != null
      ? AuthStatus.authenticated
      : AuthStatus.unauthenticated;
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(authRepositoryProvider));
});
