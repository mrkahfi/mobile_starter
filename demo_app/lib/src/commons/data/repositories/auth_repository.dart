import 'dart:convert';

import 'package:demo_app/gen/assets.gen.dart';
import 'package:demo_app/src/commons/data/mappers/user_mapper.dart';
import 'package:demo_app/src/commons/data/models/responses/user_response.dart';
import 'package:demo_app/src/commons/data/sources/sources.dart';
import 'package:demo_app/src/commons/domain/entities/user.dart';
import 'package:demo_app/src/utils/delay.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  AuthRepository(
    this.authApi, {
    required this.hiveService,
  });

  final AuthApi authApi;
  final HiveService hiveService;

  User? get currentUser => hiveService.getCurrentUser();

  Future<String?> get userToken => hiveService.getUserToken();

  Future<Result<User>> login(
    String email,
    String password,
  ) async {
    try {
      // final user = await authApi.login();
      // final response = UserResponse();
      final json = await rootBundle.loadString(Assets.jsons.user);
      final response =
          UserResponse.fromJson(jsonDecode(json) as Map<String, dynamic>);

      final user = UserMapper.mapUserResponseToUser(response);

      hiveService.saveCurrentUser(user);
      await hiveService.saveUserToken(response.token);
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

      hiveService.saveCurrentUser(user);

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

  Future<void> logout() async => hiveService
    ..deleteCurrentUser()
    ..deleteUserToken();

  void dispose() => hiveService;
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = AuthRepository(
    ref.watch(authApiProvider),
    hiveService: ref.watch(hiveServiceProvider),
  );
  ref.onDispose(auth.dispose);
  return auth;
});
