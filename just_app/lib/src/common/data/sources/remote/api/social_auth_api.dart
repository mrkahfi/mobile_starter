// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_app/src/common/data/models/responses/user_response.dart';
import 'package:just_app/src/common/data/sources/remote/config/dio_client.dart';
import 'package:just_app/src/common/data/sources/sources.dart';
import 'package:retrofit/retrofit.dart';

part 'social_auth_api.g.dart';

@RestApi()
abstract class SocialAuthApi {
  factory SocialAuthApi(Dio dio) = _SocialAuthApi;

  @POST(Endpoint.login) // TODO: set the endpoint
  Future<UserResponse> socialLogin(@Body() Map<String, dynamic> body);
}

final socialAuthApiProvider = Provider<SocialAuthApi>(
  (ref) => SocialAuthApi(ref.watch(dioClientProvider).dio),
);
