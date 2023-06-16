import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahfi_starter/src/data/repositories/auth_repository.dart';

class AuthService {
  AuthService(this.authRepository);

  final AuthRepository authRepository;

  Future<void> signIn(String email, String password) {
    return authRepository.createUserWithEmailAndPassword(email, password);
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.read(authRepositoryProvider),
  );
});
