// ignore_for_file: inference_failure_on_function_invocation

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_starter/src/data/sources/remote/config/config.dart';
import 'package:zot_starter/src/data/sources/remote/config/dio_client.dart';
import 'package:zot_starter/src/domain/entities/user.dart';
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

  Future<void> logout() async => delay();
}

final authApiProvider =
    Provider<AuthApi>((ref) => AuthApi(ref.watch(dioClientProvider)));
