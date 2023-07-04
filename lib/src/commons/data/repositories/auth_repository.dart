import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/commons/data/datasource/sources.dart';
import 'package:zot_starter/src/commons/domain/entities/user.dart';
import 'package:zot_starter/src/utils/delay.dart';
import 'package:zot_starter/src/utils/in_memory_store.dart';

class AuthRepository {
  AuthRepository(this.authApi, {InMemoryStore<User?>? authState})
      : _authState = authState ?? InMemoryStore<User?>(null);

  final AuthApi authApi;
  final InMemoryStore<User?> _authState;

  Stream<User?> authStateChanges() => _authState.stream;
  User? get currentUser => _authState.value;

  Future<Result<User>> login(
    String email,
    String password,
  ) async {
    try {
      // final user = await authApi.login();
      await delay();
      final user = User(
        uid: email.split('').reversed.join(),
        email: email,
      );

      _authState.value = user;
      return Result.success(user);
    } on Exception catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getError(e, st),
        st,
      );
    }
  }

  Future<Result<User>> register(
    String email,
    String password,
    String password2,
  ) async {
    try {
      // final user = await authApi.register();
      await delay();
      final user = User(
        uid: email.split('').reversed.join(),
        email: email,
      );

      _authState.value = user;
      return Result.success(user);
    } on Exception catch (e, st) {
      return Result.failure(
        NetworkExceptions.getDioException(e, st),
        st,
      );
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getError(e, st),
        st,
      );
    }
  }

  Future<void> logout() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository(ref.watch(authApiProvider));
  ref.onDispose(auth.dispose);
  return auth;
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
