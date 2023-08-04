import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/common/data/mappers/user_mapper.dart';
import 'package:zot_starter/src/common/data/models/requests/login_request.dart';
import 'package:zot_starter/src/common/data/sources/sources.dart';
import 'package:zot_starter/src/common/domain/entities/user.dart';
import 'package:zot_starter/src/utils/delay.dart';

class AuthRepository {
  AuthRepository(
    this.authApi, {
    required this.hiveService,
  });

  final AuthApi authApi;
  final HiveService hiveService;

  User? get currentUser => hiveService.currentUser;

  Future<String?> get userToken => hiveService.userToken;

  Future<Result<User>> login(
    String email,
    String password,
  ) async {
    final request = LoginRequest(
      email: email,
      password: password,
    );

    try {
      final response = await authApi.login(request.toJson());

      final user = UserMapper.mapUserResponseToUser(response);

      hiveService.saveCurrentUser(user);
      await hiveService.saveUserToken(response.token);
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
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

      hiveService.saveCurrentUser(user);

      return Result.success(user);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }

  Future<Result<User>> socialLogin(OAuthCredential credential) async {
    try {
      final response = await authApi.socialLogin(credential.asMap());

      final user = UserMapper.mapUserResponseToUser(response);

      hiveService.saveCurrentUser(user);
      await hiveService.saveUserToken(response.token);
      return Result.success(user);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }

  Future<void> logout() async => hiveService
    ..deleteCurrentUser()
    ..deleteUserToken();

  void dispose() => hiveService.close();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository(
    ref.watch(authApiProvider),
    hiveService: ref.watch(hiveServiceProvider),
  );
  ref.onDispose(auth.dispose);
  return auth;
});
