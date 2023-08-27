import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zot_starter/src/common/data/models/responses/example_response.dart';
import 'package:zot_starter/src/common/data/models/responses/item_response.dart';
import 'package:zot_starter/src/common/data/sources/remote/config/dio_client.dart';
import 'package:zot_starter/src/common/data/sources/sources.dart';

part 'product_api.g.dart';

@RestApi()
abstract class ProductApi {
  factory ProductApi(Dio dio) = _ProductApi;

  @GET(Endpoint.fetchItems)
  Future<ExampleResponse?> getProducts();

  @GET(Endpoint.fetchDetail)
  Future<ItemResponse> getProduct(String id);
}

final productApiApiProvider = Provider<ProductApi>(
  (ref) => ProductApi(ref.watch(dioClientProvider).dio),
);
