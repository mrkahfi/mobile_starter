// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zot_starter/src/common/data/models/responses/cart_response.dart';
import 'package:zot_starter/src/common/data/sources/remote/config/cart_endpoint.dart';
import 'package:zot_starter/src/common/data/sources/remote/config/dio_client.dart';

part 'cart_api.g.dart';

@RestApi()
abstract class CartApi {
  factory CartApi(Dio dio) = _CartApi;

  @GET(CartEndPoint.cart)
  Future<CartResponse> fetchCart();

  @POST(CartEndPoint.cart)
  Future<CartResponse> setCart();
}

final cartApiProvider = Provider<CartApi>(
  (ref) => CartApi(ref.watch(dioClientProvider).dio),
);
