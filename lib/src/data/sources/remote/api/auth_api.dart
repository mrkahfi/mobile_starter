// ignore_for_file: inference_failure_on_function_invocation

import 'package:zot_starter/src/data/sources/remote/config/config.dart';

class AuthApi {
  AuthApi(this._dioClient);

  final DioClient _dioClient;

  /// @POST(Endpoints.login)
  /// @Data(
  ///   String email (required)
  ///   String password (required)
  /// )
  /// @Return(String token)
  Future<Result<String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post(
        Endpoint.signIn,
        data: {
          'email': email,
          'password': password,
        },
      );
      return Result.success(response as String);
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

  Future<Result<void>> logout() async {
    return const Result.success(null);
  }
}
