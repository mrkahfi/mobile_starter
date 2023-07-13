// ignore_for_file: inference_failure_on_function_invocation

import 'package:demo_app/src/commons/data/sources/remote/config/config.dart';
import 'package:demo_app/src/commons/data/sources/remote/config/dio_client.dart';
import 'package:demo_app/src/commons/domain/entities/user.dart';
import 'package:demo_app/src/utils/delay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
