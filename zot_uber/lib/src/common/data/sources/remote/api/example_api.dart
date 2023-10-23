import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zot_uber/src/common/data/models/responses/example_response.dart';
import 'package:zot_uber/src/common/data/models/responses/item_response.dart';
import 'package:zot_uber/src/common/data/sources/remote/config/dio_client.dart';
import 'package:zot_uber/src/common/data/sources/sources.dart';
import 'package:retrofit/retrofit.dart';

part 'example_api.g.dart';

@RestApi()
abstract class ExampleApi {
  factory ExampleApi(Dio dio) = _ExampleApi;

  @GET(Endpoint.fetchItems)
  Future<ExampleResponse?> getItems();

  @GET(Endpoint.fetchDetail)
  Future<ItemResponse?> getDetail(String id);
}

final exampleApiProvider = Provider<ExampleApi>(
  (ref) => ExampleApi(ref.watch(dioClientProvider).dio),
);
