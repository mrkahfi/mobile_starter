import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/data/repositories/auth_repository.dart';
import 'package:zot_starter/src/domain/entities/user.dart';

class AuthService {
  AuthService(this.authRepository);

  final AuthRepository authRepository;

  Future<void> signIn(String email, String password) =>
      authRepository.signInWithEmailAndPassword(email, password);

  Future<void> signOut() => authRepository.signOut();

  Stream<User?> authStateChanges() => authRepository.authStateChanges();

  bool get isLoggedIn => authRepository.currentUser != null;
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(authRepositoryProvider));
});
