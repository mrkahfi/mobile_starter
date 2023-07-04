// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/commons/data/datasource/remote/config/config.dart';
import 'package:zot_starter/src/commons/data/datasource/remote/config/dio_client.dart';
import 'package:zot_starter/src/commons/domain/entities/user.dart';
import 'package:zot_starter/src/utils/delay.dart';

class AuthApi {
  AuthApi(this._dioClient);

  final DioClient _dioClient;

  Future<User> login({
    required String email,
    required String password,
  }) async =>
      await _dioClient.post(
        Endpoint.login,
        data: {
          'email': email,
          'password': password,
        },
      ) as User;

  Future<User> register({
    required String email,
    required String password,
    required String password2,
  }) async =>
      await _dioClient.post(
        Endpoint.register,
        data: {
          'email': email,
          'password': password,
          'confirm_password': password2,
        },
      ) as User;

  Future<void> logout() async => delay();
}

final authApiProvider =
    Provider<AuthApi>((ref) => AuthApi(ref.watch(dioClientProvider)));
